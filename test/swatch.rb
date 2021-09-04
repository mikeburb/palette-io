$: << File.expand_path('../lib', File.dirname(__FILE__))

require 'test/unit'
require 'palette-io'

module PaletteIO
  class TestPalette < Test::Unit::TestCase
    def setup
    end

    #Hexadecimal

    def test_hexadecimal_input_defaults_to_rgb_color_space
      @swatch = Swatch.new("2356A3")
      @swatchTwo = Swatch.new("#2356A3")
      assert_equal :rgb, @swatch.colorSpace
      assert_equal :rgb, @swatchTwo.colorSpace
    end

    def test_hexadecimal_input_converts_to_rgb
      @swatch = Swatch.new("2356A3")
      @swatchTwo = Swatch.new("#2356A3")
      assert_equal [35, 86, 163], @swatch.values
      assert_equal @swatchTwo.values, @swatch.values
    end

    def test_single_value_input_longer_than_7_raises_error
      assert_raise (TypeError) do
        @swatch = Swatch.new("2356A323")
      end
    end





  end
end
