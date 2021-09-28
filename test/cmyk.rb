# frozen_string_literal: false

$LOAD_PATH << File.expand_path('../lib', File.dirname(__FILE__))

require 'test/unit'
require 'palette-io'

module PaletteIO
  # Unit test for RGB Methods of the Swatch class
  class TestSwatch < Test::Unit::TestCase

    def test_cmyk_can_be_assigned_directly
      @swatch = Swatch.new(128, 100, 59, :cmyk)
      assert_equal [128, 100, 59], @swatch.values
      assert_equal :cmyk, @swatch.color_space
      assert_equal 8, @swatch.bit_depth
    end

    def test_cmyk16_values_can_be_assigned_directly
      @swatch = Swatch.new(16_384, 10_000, 23_421, :cmyk16)
      assert_equal [16_384, 10_000, 23_421], @swatch.values16
      assert_equal :cmyk, @swatch.color_space
      assert_equal 16, @swatch.bit_depth
    end
  end
end
