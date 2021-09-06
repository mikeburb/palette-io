require 'palette-io'
require 'palette-io/swatch'
module PaletteIO
  class Palette
    def initialize()
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
