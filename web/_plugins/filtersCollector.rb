# coding: utf-8

require 'set'
require 'titleize'

module Jekyll
  module FiltersCollector
    class FiltersCollector

      def collectTags( data )
        raise "received Nil data" unless not data.nil?
        topicsCount = Hash.new()
        data.each do | item |
          raise "received Nil element in data array" unless not item.nil?
          raise "received Nil papers in #{year}" unless not item["papers"].nil?
          item[ "papers" ].each do | paper |
            raise "Found paper with no tags: #{paper}" unless not paper["tags"].nil?
            paper[ "tags" ].each do | tag |
              if topicsCount[ tag ].nil? 
                topicsCount[ tag ] = 1
              else
                topicsCount[ tag ] = topicsCount[ tag ] + 1
              end
            end
          end
        end
        string = ""
        topicsCount.sort_by { | tag, count | count }.reverse.each do | tag, count |
          string += "<button class=\"btn btn-sm btn-filter btn-light keyword\">#{tag}
          <span class=\"tot badge badge-pill badge-dark\" style=\" font-size: 8pt;\">
          #{count}</span></button><span> </span>"
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
              typeSet.add( type )
            end
          end
        end
        string = ""
        typeSet.to_a.sort.each do | tag |
          string += "<button class=\"btn btn-sm btn-filter 
          btn-light type\">#{tag}</button><span> </span>"
        end
        string
      end

      def collectAuthors( data )
        raise "received Nil data" unless not data.nil?
        authorsSet = Set.new()
        data.each do | item |
          item[ "papers" ].each do | paper |
            paper[ "authors" ].each do | author |
              authorsSet.add( author )
            end
          end
        end
        string = ""
        authorsSet.to_a.sort.each do | author |
          string += "<button class=\"btn btn-sm btn-filter 
          btn-light author\">#{author}</button><span> </span>"
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