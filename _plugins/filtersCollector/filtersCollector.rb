# coding: utf-8

require 'set'

module Jekyll
  module FiltersCollector
    class FiltersCollector

      def collect( data )
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
          string += "<button class=\"btn btn-sm btn-tag btn-light\">#{tag}</button>"
        end
        string
      end
    end
  end
end