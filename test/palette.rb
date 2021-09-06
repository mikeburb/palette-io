$: << File.expand_path('../lib', File.dirname(__FILE__))

require 'test/unit'
require 'palette-io'

module PaletteIO
  class TestPalette < Test::Unit::TestCase
    def setup
      @palette = Palette.new
      @swatch = Swatch.new(100, 200, 50)
      @swatch2 = Swatch.new(100, 200, 50)
    end

    def test_palette_returns_integer_length
      assert_equal Integer, @palette.length.class
    end

    def test_append
      initial_length = @palette.length
      @palette << @swatch
      assert_equal initial_length + 1, @palette.length
    end

    def test_all_gets_all_swatches
      assert_equal [], @palette.all
    end

    def test_brackets_get_swatch_by_index
      @palette << @swatch
      assert_equal @palette[-1], @swatch
    end

    def test_swatches_extends_each
      output = []
      @palette << [@swatch1, @swatch2]
      @palette.each {|swatch| output << swatch}
      assert_equal output, @palette.all
    end

  end
end
