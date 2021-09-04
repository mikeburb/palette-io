require 'palette-io'
module PaletteIO
  class Swatch
    attr_reader :colorSpace, :values

    def initialize(*args)
      setColor(args)
    end

    def setColor(colorInput)
      @values = []
      if(colorInput.length == 1)
        parseColorSingleInput(colorInput)
      else

      end
    end

    private

    def parseColorMultiInput(colorInput)

    end

    def parseColorSingleInput(colorInput)
      colorInput = colorInput[0]
      if(colorInput.length > 5)
        fromHexadecimal(colorInput)
      end
    end

    def fromHexadecimal(hexcolor)
      if(hexcolor.length > 6)
        if(hexcolor.length == 7)
          hexcolor.slice!(0, 1)
        else
          raise TypeError, "Invalid color input value."
        end
      end
      hexValues = hexcolor.scan(/\w{2}/)
      hexValues.each {|hexValue| @values << hexValue.to_i(16)}
      @colorSpace = :rgb
    end


  end
end
