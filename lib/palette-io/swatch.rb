# frozen_string_literal: true

require 'palette-io'
require 'palette-io/rgb'
require 'palette-io/hsb'
require 'palette-io/cmyk'
require 'palette-io/grayscale'

module PaletteIO
  # Holds color information for a single color. Able to store and
  # convert a variety of color space formats.
  class Swatch
    attr_reader :color_space, :bit_depth

    def initialize(*args)
      if args[-1].instance_of?(Symbol)
        to_color_space(args, args.pop)
      else
        to_color(args)
      end
    end

    # TODO: (To be completed for v 0.1)
    # - Add internal color space conversions
    # - Add validations and Error handling

    def to_color(color_input)
      if color_input.length == 1
        parse_color_single_input(color_input)
      else
        parse_color_multi_input(color_input)
      end
    end

    def to_color_space(color_input, color_space_input)
      if color_space_input[-2, 2] == '16'
        to_16_bit_color_space(color_input, color_space_input)
      else
        to_8_bit_color_space(color_input, color_space_input)
      end
    end

    def to_8_bit_color_space(color_input, color_space_input)
      @bit_depth = 8
      @color_space = valid_color_space(color_space_input)
      @values = format_values(color_input)
    end

    def to_16_bit_color_space(color_input, color_space_input)
      @bit_depth = 16
      @color_space = valid_color_space(color_space_input.to_s[0...-2].to_sym)
      @values16 = format_values(color_input)
    end

    def values
      convert_to_8_bit unless @values
      @values
    end

    def values16
      convert_to_16_bit unless @values16
      @values16
    end

    def ==(other)
      return false unless other.is_a?(Swatch)

      @values == other.values && @color_space == other.color_space
    end

    private

    def format_values(color_input)
      values = []
      color_input.each { |value| values << (value.to_i) }
      values
    end

    def valid_color_space(color_space_input)
      unless %i[rgb hsb hsl cmyk grayscale].include?(color_space_input)
        raise TypeError, "#{color_space_input} is an invalid color space."
      end

      color_space_input
    end

    def convert_to_8_bit
      return nil unless @values16

      @values = []
      @values16.each { |value16| @values << Integer.sqrt(value16) }
    end

    def convert_to_16_bit
      return nil unless @values

      @values16 = []
      @values.each { |value| @values16 << value * value }
    end

    def parse_color_multi_input(color_input)
      case color_input.length
      when 3
        to_8_bit_color_space(color_input, :rgb)
      when 4
        to_8_bit_color_space(color_input, :cmyk)
      end
    end

    def parse_color_single_input(color_input)
      color_input = color_input[0]
      if color_input.is_a?(Integer)
        to_8_bit_color_space([color_input], :grayscale)
      elsif color_input.length > 5
        from_hexadecimal(color_input)
      else
        to_8_bit_color_space([color_input.to_i], :grayscale)
      end
    end

    def from_hexadecimal(hex_values)
      format_hexadecimal(hex_values)
      @values = []
      @bit_depth = 8
      hex_values = hex_values.scan(/\w{2}/)
      hex_values.each { |hex_value| @values << hex_value.to_i(16) }
      @color_space = :rgb
    end

    def format_hexadecimal(hex_values)
      hex_values.slice!(0, 1) if hex_values.length == 7
      return hex_values if hex_values.length == 6

      raise TypeError, 'Invalid color input value.'
    end
  end
end
