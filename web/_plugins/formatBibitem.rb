# coding: utf-8

module Jekyll
  module FormatBibitem
    class FormatBibitem

      def formatBibitem( data )
        raise "received Nil data" unless !data.nil?
        BibTeX.parse( data ).to_s
      end
    end
  end
end

module Jekyll
  module FormatBibitem
    def formatBibitem(data)
      config = @context.registers[:site].config['formatBibitem'] || {}
      fc = FormatBibitem.new()
      fc.formatBibitem(data)
    end
  end
end

Liquid::Template.register_filter(Jekyll::FormatBibitem)