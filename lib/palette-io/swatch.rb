require 'palette-io'
module PaletteIO
  class Swatch
    attr_reader :colorSpace, :values

    def initialize(*args)
      setColor(args)
    end

    def setColor(colorInput)
      if(colorInput.length == 1)
        parseColorSingleInput(colorInput)
      else
        parseColorMultiInput(colorInput)
      end
    end

    private

    def parseColorMultiInput(colorInput)
      if(colorInput.length == 3)
        setRGB(colorInput)
      end
    end

    def parseColorSingleInput(colorInput)
      colorInput = colorInput[0]
      if(colorInput.is_a?(Integer))
        setGrayscale(colorInput)
      else
        if(colorInput.length > 5)
          setHexadecimal(colorInput)
        else
          setGrayscale(colorInput.to_i)
        end
      end
    end

    def setRGB(rgbValues)
      @values = []
      rgbValues.each {|rgbValue| @values << (rgbValue.to_i)}

      @colorSpace = :rgb
    end

    def setHexadecimal(hexcolor)
      if(hexcolor.length > 6)
        if(hexcolor.length == 7)
          hexcolor.slice!(0, 1)
        else
          raise TypeError, "Invalid color input value."
        end
      end
      @values = []
      hexValues = hexcolor.scan(/\w{2}/)
      hexValues.each {|hexValue| @values << hexValue.to_i(16)}
      @colorSpace = :rgb
    end

    def setGrayscale(value)
      @values = [value, 0 , 0]
      @colorSpace = :grayscale
    end


  end
end
