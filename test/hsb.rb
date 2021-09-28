# frozen_string_literal: false

$LOAD_PATH << File.expand_path('../lib', File.dirname(__FILE__))

require 'test/unit'
require 'palette-io'

module PaletteIO
  # Unit test for RGB Methods of the Swatch class
  class TestSwatch < Test::Unit::TestCase

    def test_hsb_can_be_assigned_directly
      @swatch = Swatch.new(128, 100, 59, :hsb)
      assert_equal [128, 100, 59], @swatch.values
      assert_equal :hsb, @swatch.color_space
    end

    def test_hsb16_values_can_be_assigned_directly
      @swatch = Swatch.new(16_384, 10_000, 23_421, :hsb16)
      assert_equal [16_384, 10_000, 23_421], @swatch.values16
      assert_equal :hsb16, @swatch.color_space
    end
  end
end
