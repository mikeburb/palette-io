# frozen_string_literal: false

$LOAD_PATH << File.expand_path('../lib', File.dirname(__FILE__))

require 'test/unit'
require 'palette-io'

module PaletteIO
  # Unit test for RGB Methods of the Swatch class
  class TestSwatch < Test::Unit::TestCase
    def test_rgb_can_be_assigned_directly
      swatch = Swatch.new(100, 45, 234, :rgb)
      assert_equal [100, 45, 234], swatch.values
      assert_equal :rgb, swatch.color_space
      assert_equal 8, swatch.bit_depth
    end

    def test_rgb16_values_can_be_assigned_directly
      swatch = Swatch.new(1_002, 452, 23_421, :rgb16)
      assert_equal [1_002, 452, 23_421], swatch.values16
      assert_equal :rgb, swatch.color_space
      assert_equal 16, swatch.bit_depth
    end

    def test_to_rgb_from_hsl_converts_to_rgb
      swatch = Swatch.new(305, 75, 50, :hsl)
      assert_equal [223, 32, 207], swatch.to_rgb
      swatch2 = Swatch.new(122, 56, 78, :hsl)
      assert_equal [167, 230, 170], swatch2.to_rgb
    end

    def test_to_rgb_from_hsb_converts_to_rgb
      swatch = Swatch.new(128, 80, 59, :hsb)
      assert_equal [30, 150, 46], swatch.to_rgb
      swatch2 = Swatch.new(20, 25, 38, :hsb)
      assert_equal [97, 81, 73], swatch2.to_rgb
    end
  end
end
