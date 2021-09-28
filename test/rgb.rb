# frozen_string_literal: false

$LOAD_PATH << File.expand_path('../lib', File.dirname(__FILE__))

require 'test/unit'
require 'palette-io'

module PaletteIO
  # Unit test for RGB Methods of the Swatch class
  class TestSwatch < Test::Unit::TestCase

    def test_rgb_can_be_assigned_directly
      @swatch = Swatch.new(100, 45, 234, :rgb)
      assert_equal [100, 45, 234], @swatch.values
      assert_equal :rgb, @swatch.color_space
    end

    def test_rgb16_values_can_be_assigned_directly
      @swatch = Swatch.new(1_002, 452, 23_421, :rgb16)
      assert_equal [1_002, 452, 23_421], @swatch.values16
      assert_equal :rgb16, @swatch.color_space
    end
  end
end
