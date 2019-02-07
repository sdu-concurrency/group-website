require 'bibtex'
require 'citeproc'
require 'csl/styles'
require 'concurrent'
require 'fileutils'
require 'digest'
require 'possibly'

module Jekyll
  class PapersGenerator < Generator
    priority :highest
    @@cache_dir = ""
    @@MD5 = Digest::MD5.new

    def getCacheFilename( file )
      "#{@@cache_dir}/#{File.basename( file )}.cache"
    end

    def getCachedFile( file )
      ret = None()
      if( File.exists? ( getCacheFilename( file ) ) )
        ret = Maybe( Marshal.load( File.read( getCacheFilename( file ) ) ) )
      end
      ret
    end

    def cacheAndReturn( file, md5, content )
      if( not File.directory? ( @@cache_dir ) )
        FileUtils.mkdir_p ( @@cache_dir )
      end
      File.write( getCacheFilename( file ), Marshal.dump( { "MD5" => md5, "content" => content } ) )
      content
    end

    def isValidMD5( cachedMD5, content )
      cachedMD5 == getMD5( content )
    end

    def getMD5( content )
      @@MD5.reset
      @@MD5 << content
      @@MD5.hexdigest
    end

    def getCachedContent( file, content )
      ret = None()
      cachedContent = getCachedFile( file )
      if cachedContent.is_some? and isValidMD5( cachedContent.get[ "MD5" ], content )
        ret = Maybe( cachedContent.get[ "content" ] )
      end
      ret
    end

    def getYear( file, iconMap )
      content = File.read( file )
      cachedContent = getCachedContent( file, content )
      if cachedContent.is_none?
        tmp = JSON.parse( content )
        hashMap = Hash.new
        tmp["papers"].each { | item |
          bibitem = item[ "bibitem" ]
          id = bibitem[ bibitem.index( "{" )+1..bibitem.index( "," )-1 ]
          hashMap[ id ] = item
        }
        tmp_p = Array.new
        hashMap.sort.each { | item |
          tmp_p << item[1]
        }
        tmp_p.each { | item |
          links = item["links"] || Array.new
          links.each { | link |
            unless link["name"].nil?
              link["name"].downcase!
            end
            if ( link["icon"].nil? )
              link["icon"] = iconMap[ link["pdf"] ]
            else
             unless iconMap[ link["icon"] ].nil?
              link["icon"] = iconMap[ link["icon"] ]
             end
            end
          }
          bibitem = item["bibitem"]#.gsub("\\\\","\\")
          b = BibTeX.parse( bibitem ).convert(:latex)
          # use the the bib url if item does not specify a link for the paper
          unless b[0]["url"].nil? || links.any?{ |h| h["name"] == "paper" || h["name"] == nil}
            links.insert(0, {
              "link" => b[0].url, "name" => "paper",
              "icon" => (b[0].url.end_with?(".pdf") ? iconMap["pdf"] : iconMap["generic"] )
            })
          end
          # use the the bib doi if item does not specify one
          unless b[0]["doi"].nil? || links.any?{ |h| h["name"] == "doi"}
            links.insert(0, {
              "link" => "https://doi.org/" << b[0].doi.gsub("\\",""),
              "name" => "doi",
              "icon" => "ai ai-doi"
            })
          end
          b[0].delete("doi")
          b[0].delete("url")
          b[0].title = "<span class=\"paper-title\">#{b[0].title}</span>"
          cp = CiteProc::Processor.new style: 'apa', format: 'text'
          name = cp.engine.style.macros['author'] > 'names' > 'name'
          name[:initialize] = 'false'
          name["sort-separator"] = ' '
          name["form"] = 'long'
          name["name-as-sort-order"] = 'active'

          item["id"] = b[0].key

          cp.import b.to_citeproc
          item["content"] = cp.bibliography().references[0]
          # unless cp.items.size <= 0
          #   item["abstract"] = cp.items[cp.items.keys[0]].abstract.value
          # end
          item["links"] = links
          # titlecaseing and null filtering for tags, type, and authors
          type = item["type"]
          unless type.nil? || type.length == 0
            item["type"] = type.downcase.titleize
          end
          item["authors"].map! { | e |
            unless e.nil? || e.length == 0
              e.downcase.titleize
            end
            }.collect!
          item["tags"].map! { | e |
            unless e.nil? || e.length == 0
              e.downcase.titleize
            end
            }.collect!
        }
        cacheAndReturn( file, getMD5( content ), { "year" => tmp["title"], "papers" => tmp_p } )
      else
        cachedContent.get
      end
    end

    def generate( site )
      @@cache_dir = "#{site.source}/.plugins_cache/papersGenerator"
      iconMap = JSON.parse( File.read( "#{site.source}/_plugins/paper_icon_mapping.json" ) )
      base = "#{site.source}/_data"
      papers = Array.new
      pool = Concurrent::FixedThreadPool.new(6)
      i=1
      # unless File.file?( "#{site.source}/no_publications" )
      unless site.config["no_publications"]
        Dir["#{base}/papers/*.json"]
        .select{ |f| /\d+/.match( f ) }
        .sort_by{ |f| File.basename( f , ".json" ) }.reverse
        .each do | f |
          j = i
          i = i + 1
          pool.post do
            papers[ j ] = getYear( f, iconMap )
          end
        end
      end
      ## plus add preprints
      pool.shutdown
      pool.wait_for_termination
      papers[ 0 ] = getYear( Dir["#{base}/papers/preprints.json"][0], iconMap )
      papers[ i ] = getYear( Dir["#{base}/papers/drafts.json"][0], iconMap )
      site.data["papers"] = papers
    end
  end
end