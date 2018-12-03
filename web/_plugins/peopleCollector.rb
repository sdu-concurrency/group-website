require "pp"

module Jekyll
  class PeopleCollector < Generator
    priority :highest

    def generate(site)
      base = "#{site.source}/_data"
      people = Array.new
      Dir["#{base}/people/*.json"].sort_by{ |f| File.basename( f , ".json" ) }.each do | f |
        people << JSON.parse( File.read( f ) )
      end
      visiting = Array.new
      Dir["#{base}/people/visiting/*.json"].sort_by{ |f| File.basename( f , ".json" ) }.each do | f |
        visiting << JSON.parse( File.read( f ) )
      end
      site.data["people"] = people
      site.data["visiting"] = visiting
      pp site.data
    end
  end
end