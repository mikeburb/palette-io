# frozen_string_literal: false

$LOAD_PATH << File.expand_path('../lib', File.dirname(__FILE__))

require 'test/unit'
require 'palette-io'

module PaletteIO
  # Unit test for RGB Methods of the Swatch class
  class TestSwatch < Test::Unit::TestCase

    def test_grayscale_can_be_assigned_directly
      @swatch = Swatch.new(154, :grayscale)
      assert_equal [154], @swatch.values
      assert_equal :grayscale, @swatch.color_space
      assert_equal 8, @swatch.bit_depth
    end

    def test_grayscale16_values_can_be_assigned_directly
      @swatch = Swatch.new(12_337, :grayscale16)
      assert_equal [12_337], @swatch.values16
      assert_equal :grayscale, @swatch.color_space
      assert_equal 16, @swatch.bit_depth
    end
  end
end
