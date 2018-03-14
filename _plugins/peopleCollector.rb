module Jekyll
  class PeopleCollector < Generator
    priority :highest

    def generate(site)
      base = "#{site.source}/_data"
      people = Array.new
      Dir["#{base}/people_*.json"].sort_by{ |f| File.basename( f , ".json" ) }.each do | f |
        people << JSON.parse( File.read( f ) )
        puts "added #{JSON.parse( File.read( f ) )["name"]}"
      end
      site.data["people"] = people
    end
  end
end