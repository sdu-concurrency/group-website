require_relative "filtersCollector/filtersCollector"

module Jekyll
  module FiltersCollector
    def collectFilters(data)
      config = @context.registers[:site].config['collectFilters'] || {}
      fc = FiltersCollector.new()
      fc.collect(data)
    end
  end
end

Liquid::Template.register_filter(Jekyll::FiltersCollector)