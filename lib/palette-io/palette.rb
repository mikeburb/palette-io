# frozen_string_literal: true

require 'palette-io'
require 'palette-io/swatch'

module PaletteIO
  # Container for swatches that contains all conversion methods
  class Palette
    def initialize
      @swatches = []
    end

    def [](index)
      @swatches[index]
    end

    def <<(swatch)
      @swatches << swatch
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
  end
end
