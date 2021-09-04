$: << File.expand_path('../lib', File.dirname(__FILE__))

require 'test/unit'
require 'palette-io'

module PaletteIO
  class TestPalette < Test::Unit::TestCase
    def setup
      @palette = Palette.new
    end

    def test_palette_returns_integer_length
      assert_equal Integer, @palette.length.class
    end
  end
end
