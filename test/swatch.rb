# frozen_string_literal: false

$LOAD_PATH << File.expand_path('../lib', File.dirname(__FILE__))

require 'test/unit'
require 'palette-io'

module PaletteIO
  # Unit test for the Swatch class
  class TestSwatch < Test::Unit::TestCase
    # Hexadecimal

    def test_hexadecimal_input_defaults_to_rgb_color_space
      @swatch = Swatch.new('2356A3')
      @swatch_two = Swatch.new('#2356A3')
      assert_equal :rgb, @swatch.color_space
      assert_equal :rgb, @swatch_two.color_space
    end

    def test_hexadecimal_input_converts_to_rgb
      @swatch = Swatch.new('2356A3')
      @swatch_two = Swatch.new('#2356A3')
      assert_equal [35, 86, 163], @swatch.values
      assert_equal @swatch_two.values, @swatch.values
    end

    def test_single_value_input_longer_than_7_raises_error
      assert_raise TypeError do
        @swatch = Swatch.new('2356A323')
      end
    end

    # RGB

    def test_3_values_defaults_to_rgb_color_space
      @swatch = Swatch.new(100, 45, 234)
      @swatch_two = Swatch.new('100', '45', '234')
      assert_equal :rgb, @swatch.color_space
      assert_equal :rgb, @swatch_two.color_space
    end

    def test_3_numbers_convert_to_rgb_value
      @swatch = Swatch.new(100, 45, 234)
      @swatch_two = Swatch.new('100', '45', '234')
      assert_equal [100, 45, 234], @swatch.values
      assert_equal [100, 45, 234], @swatch_two.values
    end

    # HSA16

    def test_hsb16_values_can_be_assigned_directly
      @swatch = Swatch.new(3_032, 5_652, 12_481, :hsb16)
      assert_equal [3_032, 5_652, 12_481], @swatch.values16
      assert_equal :hsb16, @swatch.color_space
    end

    # CMYK

    def test_4_values_defaults_to_rgb_color_space
      @swatch = Swatch.new(40, 172, 13, 65)
      @swatch_two = Swatch.new('40', '172', '13', '65')
      assert_equal :cmyk, @swatch.color_space
      assert_equal :cmyk, @swatch_two.color_space
    end

    def test_4_numbers_convert_to_cmyk_value
      @swatch = Swatch.new(40, 172, 13, 65)
      @swatch_two = Swatch.new('40', '172', '13', '65')
      assert_equal [40, 172, 13, 65], @swatch.values
      assert_equal [40, 172, 13, 65], @swatch_two.values
    end

    def test_cmyk_can_be_assigned_directly
      @swatch = Swatch.new(40, 172, 13, 65, :cmyk)
      assert_equal [40, 172, 13, 65], @swatch.values
      assert_equal :cmyk, @swatch.color_space
    end

    # CMYK16

    def test_cmyk16_values_can_be_assigned_directly
      @swatch = Swatch.new(1_002, 452, 23_421, 5_463, :cmyk16)
      assert_equal [1_002, 452, 23_421, 5_463], @swatch.values16
      assert_equal :cmyk16, @swatch.color_space
    end

    # Grayscale

    def test_numeric_input_under_six_digits_is_gray_scale_color_space
      @swatch = Swatch.new(256)
      @swatch_two = Swatch.new('256')
      assert_equal :grayscale, @swatch.color_space
      assert_equal :grayscale, @swatch_two.color_space
    end

    def test_numberic_or_under_six_digits_converts_to_gray_scale
      @swatch = Swatch.new(51)
      @swatch_two = Swatch.new('256')
      assert_equal [51, 0, 0], @swatch.values
      assert_equal [256, 0, 0], @swatch_two.values
    end

    def test_grayscale_can_be_assigned_directly
      @swatch = Swatch.new(51, :grayscale)
      assert_equal [51, 0, 0], @swatch.values
      assert_equal :grayscale, @swatch.color_space
    end

    # Grayscale 16

    def test_grayscale16_values_can_be_assigned_directly
      @swatch = Swatch.new(5463, :grayscale16)
      assert_equal [5463, 0, 0], @swatch.values16
      assert_equal :grayscale16, @swatch.color_space
    end

    # BitConversion

    def test_16_bit_conversion_from_8_bit_values
      @swatch = Swatch.new(100, 45, 234)
      assert_equal [10_000, 2025, 54_756], @swatch.values16
    end

    def test_8_bit_conversion_from_16_bit_values
      @swatch = Swatch.new(10_000, 2025, 54_756, :rgb16)
      assert_equal [100, 45, 234], @swatch.values
    end

    # Overloaded Object Metods

    def test_swatch_equivalancy_is_value_based
      @swatch = Swatch.new(256)
      @swatch_two = Swatch.new('256')
      assert_equal(@swatch, @swatch_two)
    end
  end
end
