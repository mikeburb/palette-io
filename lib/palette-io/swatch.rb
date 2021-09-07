# frozen_string_literal: true

require 'palette-io'
module PaletteIO
  # Holds color information for a single color. Able to store and
  # convert a variety of color space formats.
  class Swatch
    attr_reader :color_space

    def initialize(*args)
      to_color(args)
    end

    # TODO: (To be completed for v 0.1)
    # - Add 16-bit color color input
    # - Add internal color space conversions
    # - Add validations and Error handling

    def to_color(color_input)
      if color_input.length == 1
        parse_color_single_input(color_input)
      else
        parse_color_multi_input(color_input)
      end
    end

    def values
      convert_to_8_bit unless @values
      @values
    end

    def values16
      convert_to_16_bit unless @values16
      @values16
    end

    private

    def convert_to_8_bit
      return nil unless @values16

      # TODO: Write conversion
      @values16
    end

    def convert_to_16_bit
      return nil unless @values

      @values16 = []
      @values.each { |value| @values16 << value * value }
    end

    def parse_color_multi_input(color_input)
      case color_input.length
      when 3
        as_rgb(color_input)
      when 4
        as_cmyk(color_input)
      end
    end

    def parse_color_single_input(color_input)
      color_input = color_input[0]
      if color_input.is_a?(Integer)
        as_grayscale(color_input)
      elsif color_input.length > 5
        as_hexadecimal(color_input)
      else
        as_grayscale(color_input.to_i)
      end
    end

    def as_rgb(rgb_values)
      @values = []
      rgb_values.each { |rgb_value| @values << (rgb_value.to_i) }
      @color_space = :rgb
    end

    def as_cmyk(cmyk_values)
      @values = []
      cmyk_values.each { |cmyk_value| @values << (cmyk_value.to_i) }
      @color_space = :cmyk
    end

    def as_hexadecimal(hex_values)
      format_hexadecimal(hex_values)
      @values = []
      hex_values = hex_values.scan(/\w{2}/)
      hex_values.each { |hex_value| @values << hex_value.to_i(16) }
      @color_space = :rgb
    end

    def format_hexadecimal(hex_values)
      hex_values.slice!(0, 1) if hex_values.length == 7
      return hex_values if hex_values.length == 6

      raise TypeError, 'Invalid color input value.'
    end

    def as_grayscale(grayscale_value)
      @values = [grayscale_value, 0, 0]
      @color_space = :grayscale
    end
  end
end
