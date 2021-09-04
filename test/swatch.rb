$: << File.expand_path('../lib', File.dirname(__FILE__))

require 'test/unit'
require 'palette-io'

module PaletteIO
  class TestPalette < Test::Unit::TestCase
    def setup
    end

    def test_single_parameter_six_plus_digit_swatch_has_hexadecimal_color_space
      @swatch = Swatch.new("235613")
      @swatchTwo = Swatch.new(23,56,13)
      assert_equal :hexadecimal, @swatch.colorSpace
      assert @swatchTwo.colorSpace != :hexadecimal
    end
  end
end
