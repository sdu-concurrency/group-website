require 'bibtex'
require 'citeproc'
require 'csl/styles'

module Jekyll
  class PapersGenerator < Generator
    priority :highest

    def addYear( file, papers, iconMap )
      tmp = JSON.parse( File.read( file ) )
      hashMap = Hash.new
      tmp.each { | item | 
        bibitem = item[ "bibitem" ]
        id = bibitem[ bibitem.index( "{" )+1..bibitem.index( "," )-1 ]
        hashMap[ id ] = item
      }
      tmp = Array.new
      hashMap.sort.each { | item |
        tmp << item[1]
      }
      tmp.each { | item |
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
      item["links"] = links
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
						"icon" => "ai ai-doi" })
        end
        b[0].delete("doi")
        b[0].delete("url")
        b[0].title = "<span class=\"paper-title\">#{b[0].title}</span>"
        cp = CiteProc::Processor.new style: 'apa', format: 'text'
        cp.import b.to_citeproc
        item["content"] = cp.bibliography().references[0]
          # unless cp.items.size <= 0
          #   item["abstract"] = cp.items[cp.items.keys[0]].abstract.value
          # end
        }
        papers << { "year" =>  File.basename( file , ".json" ), "papers" => tmp }
      end

      def generate(site)
        iconMap = JSON.parse( File.read( "#{site.source}/_plugins/paper_icon_mapping.json" ) )
        base = "#{site.source}/_data"
        papers = Array.new
        Dir["#{base}/papers/*.json"]
        .select{ |f| /\d+/.match( f ) }
        .sort_by{ |f| File.basename( f , ".json" ) }.reverse
        .each do | f |
          addYear( f, papers, iconMap )
        end
        ## plus add preprints
        addYear( Dir["#{base}/papers/Preprints.json"][0], papers, iconMap )
        site.data["papers"] = papers
      end
    end
  end