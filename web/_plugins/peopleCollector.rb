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
      alumni = Array.new
      Dir["#{base}/people/alumni/*.json"].sort_by{ |f| File.basename( f , ".json" ) }.each do | f |
        alumni << JSON.parse( File.read( f ) )
      end
      former = Array.new
      Dir["#{base}/people/former/*.json"].sort_by{ |f| File.basename( f , ".json" ) }.each do | f |
        former << JSON.parse( File.read( f ) )
      end
      visiting = Array.new
      Dir["#{base}/people/visiting/*.json"].sort_by{ |f| File.basename( f , ".json" ) }.each do | f |
        visiting << JSON.parse( File.read( f ) )
      end
      externals = Array.new
      Dir["#{base}/people/externals/*.json"].sort_by{ |f| File.basename( f , ".json" ) }.each do | f |
        externals << JSON.parse( File.read( f ) )
      end
      site.data["people"] = people
      site.data["people_alumni"] = alumni
      site.data["people_former"] = former
      site.data["people_visiting"] = visiting
      site.data["people_externals"] = externals
    end
  end
end