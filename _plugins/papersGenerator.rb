require 'bibtex'
require 'citeproc'
require 'csl/styles'

module Jekyll
  class PapersGenerator < Generator
    priority :highest

    def addYear( file, papers )
      tmp = JSON.parse( File.read( file ) )
      tmp.each { |item|
        links = item["links"] || Array.new
        links.each { |link|
          unless link["name"].nil?
            link["name"].downcase!
          end
        }
        item["links"] = links
        bibitem = item["bibitem"].gsub("\\\\","\\")
        b = BibTeX.parse( bibitem ).convert(:latex)
        unless b[0]["doi"].nil? || links.any?{ |h| h["name"] == "doi"}
          links.insert(0, { "link" => "https://doi.org/" << b[0].doi, "name" => "doi", "icon" => "ai ai-doi" })
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
        base = "#{site.source}/_data"
        papers = Array.new
        Dir["#{base}/papers/*.json"]
        .select{ |f| /\d+/.match( f ) }
        .sort_by{ |f| File.basename( f , ".json" ) }.reverse
        .each do | f |
          addYear( f, papers )
        end
        ## plus add preprints
        addYear( Dir["#{base}/papers/Preprints.json"][0], papers )
        site.data["papers"] = papers
    end
  end
end