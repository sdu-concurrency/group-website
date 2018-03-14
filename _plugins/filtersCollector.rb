# coding: utf-8

require 'set'

module Jekyll
  module FiltersCollector
    class FiltersCollector

      def collectTags( data )
        raise "received Nil data" unless !data.nil?
        topicsSet = Set.new()
        data.each do | item |
          item[ "papers" ].each do | paper |
            paper[ "tags" ].each do | tag |
              topicsSet.add( tag )
            end
          end
        end
        string = ""
        topicsSet.each do | tag |
          string += "<button class=\"btn btn-sm btn-filter btn-light\">#{tag}</button><span> </span>"
        end
        string
      end

      def collectAuthors( data )
        raise "received Nil data" unless !data.nil?
        authorsSet = Set.new()
        data.each do | item |
          item[ "papers" ].each do | paper |
            paper[ "authors" ].each do | author |
              authorsSet.add( author )
            end
          end
        end
        string = ""
        authorsSet.each do | author |
          string += "<button class=\"btn btn-sm btn-filter btn-light\">#{author}</button><span> </span>"
        end
        string
      end
    end
  end
end

module Jekyll
  module FiltersCollector
    def collectTags(data)
      config = @context.registers[:site].config['collectTags'] || {}
      fc = FiltersCollector.new()
      fc.collectTags(data)
    end
    def collectAuthors(data)
      config = @context.registers[:site].config['collectAuthors'] || {}
      fc = FiltersCollector.new()
      fc.collectAuthors(data)
    end
  end
end

Liquid::Template.register_filter(Jekyll::FiltersCollector)