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

    #RGB

    def test_3_values_defaults_to_rgb_color_space
      @swatch = Swatch.new(100, 45, 234)
      @swatchTwo = Swatch.new("100", "45", "234")
      assert_equal :rgb, @swatch.colorSpace
      assert_equal :rgb, @swatchTwo.colorSpace
    end

    def test_3_numbers_convert_to_rgb_value
      @swatch = Swatch.new(100, 45, 234)
      @swatchTwo = Swatch.new("100", "45", "234")
      assert_equal [100, 45, 234], @swatch.values
      assert_equal [100, 45, 234], @swatchTwo.values
    end

    #Grayscale

    def test_numeric_input_under_six_digits_is_gray_scale_color_space
      @swatch = Swatch.new(256)
      @swatchTwo = Swatch.new("256")
      assert_equal :grayscale, @swatch.colorSpace
      assert_equal :grayscale, @swatchTwo.colorSpace
    end

    def test_numberic_or_under_six_digits_converts_to_gray_scale
      @swatch = Swatch.new(51)
      @swatchTwo = Swatch.new("256")
      assert_equal [51, 0, 0], @swatch.values
      assert_equal [256, 0, 0], @swatchTwo.values
    end



  end
end
