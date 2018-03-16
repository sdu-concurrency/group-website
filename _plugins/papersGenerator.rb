module Jekyll
  class PapersGenerator < Generator
    priority :highest

    def generate(site)
      base = "#{site.source}/_data"
      papers = Array.new
      Dir["#{base}/papers/*.json"].sort_by{ |f| File.basename( f , ".json" ) }.reverse.each do | f |
        papers << { "year" =>  File.basename( f , ".json" )[/\d+/], "papers" => JSON.parse( File.read( f ) ) }
      end
      site.data["papers"] = papers
    end
  end
end