require 'bibtex'
require 'citeproc'
require 'csl/styles'

module Jekyll
  class PapersGenerator < Generator
    priority :highest

    def generate(site)
      base = "#{site.source}/_data"
      papers = Array.new
      Dir["#{base}/papers/*.json"].sort_by{ |f| File.basename( f , ".json" ) }.reverse.each do | f |
        tmp = JSON.parse( File.read( f ) )
        tmp.each { |item|
          b = BibTeX.parse(item["bibitem"])
          cp = CiteProc::Processor.new style: 'apa', format: 'text'
          cp.import b.to_citeproc
          item["content"] = cp.bibliography().references[0]
          unless cp.items.size <= 0
            item["abstract"] = cp.items[cp.items.keys[0]].abstract.value
          end
        }
        papers << { "year" =>  File.basename( f , ".json" )[/\d+/], "papers" => tmp }
      end
      site.data["papers"] = papers
    end
  end
end