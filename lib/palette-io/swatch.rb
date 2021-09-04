require 'palette-io'
module PaletteIO
  class Swatch
    attr_reader :colorSpace

    def initialize(*args)
      setColor(args)
    end

    def setColor(colorInput)
      if(colorInput.length == 1)
        colorInput = colorInput[0]
      end
      if(colorInput.length > 5)
        @colorSpace = :hexadecimal
      end
    end



  end
end
