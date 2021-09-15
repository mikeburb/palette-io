# frozen_string_literal: true

require 'palette-io'
require 'palette-io/swatch'

module PaletteIO
  # Container for swatches that has interface for all conversion methods
  class Palette
    def initialize
      @swatches = []
    end

    def [](index)
      @swatches[index]
    end

    def <<(swatch_data)
      add_swatch_data(swatch_data)
    end

    def add(*swatch_data)
      add_swatch_data(swatch_data)
    end

    def length
      @swatches.length
    end

    def all
      @swatches
    end

    def each(&block)
      @swatches.each(&block)
    end

    private

    def add_swatch_data(swatch_data)
      if swatch_data.is_a?(Array) && swatch_data.length > 1
        data_type = swatch_data[0].class
        return add_swatches swatch_data if [Swatch, Array].include?(data_type)
      end
      add_swatch swatch_data
    end

    def add_swatches(swatches_data)
      swatches_data.each { |swatch_data| add_swatch(swatch_data) }
    end

    def add_swatch(swatch_data)
      swatch_data = Swatch.new(*swatch_data) unless swatch_data.is_a?(Swatch)
      @swatches << swatch_data
    end
  end
end
