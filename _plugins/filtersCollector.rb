# coding: utf-8

require 'set'
require 'titleize'

module Jekyll
  module FiltersCollector
    class FiltersCollector

      def collectTags( data )
        raise "received Nil data" unless not data.nil?
        topicsSet = Set.new()
        data.each do | item |
          item[ "papers" ].each do | paper |
            paper[ "tags" ].each do | tag |
              if( (not tag.nil?) && tag.length > 0 )
                topicsSet.add( tag.downcase.titleize )
              end
            end
          end
        end
        string = ""
        topicsSet.each do | tag |
          string += "<button class=\"btn btn-sm btn-filter btn-light\">#{tag}</button><span> </span>"
        end
        string
      end

      def collectTypes( data )
        raise "received Nil data" unless not data.nil?
        typeSet = Set.new()
        data.each do | item |
          item[ "papers" ].each do | paper |
            type = paper[ "type" ]
            if( (not type.nil?) && type.length > 0 )
              typeSet.add( type.downcase.titleize )
            end
          end
        end
        string = ""
        typeSet.each do | tag |
          string += "<button class=\"btn btn-sm btn-filter btn-light\">#{tag}</button><span> </span>"
        end
        string
      end

      def collectAuthors( data )
        raise "received Nil data" unless not data.nil?
        authorsSet = Set.new()
        data.each do | item |
          item[ "papers" ].each do | paper |
            paper[ "authors" ].each do | author |
              if( (not author.nil?) && author.length > 0 )
                authorsSet.add( author.downcase.titleize )
              end
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
    def collectTypes(data)
      config = @context.registers[:site].config['collectTypes'] || {}
      fc = FiltersCollector.new()
      fc.collectTypes(data)
    end
  end
end

Liquid::Template.register_filter(Jekyll::FiltersCollector)