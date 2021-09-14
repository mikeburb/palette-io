# frozen_string_literal: true

$LOAD_PATH << File.expand_path('../lib', File.dirname(__FILE__))

require 'test/unit'
require 'palette-io'

module PaletteIO
  # Test for Palette Class
  class TestPalette < Test::Unit::TestCase
    def setup
      @palette = Palette.new
      @swatch = Swatch.new(100, 200, 50)
      @swatch2 = Swatch.new(100, 200, 50)
      @swatch3 = Swatch.new(40, 50, 60)
      @swatches = []
      100.times { @swatches << Swatch.new(40, 200, 11) }
    end

    def test_palette_returns_integer_length
      assert_equal Integer, @palette.length.class
    end

    def test_append
      initial_length = @palette.length
      @palette << @swatch
      assert_equal initial_length + 1, @palette.length
    end

    def test_append_multiple
      initial_length = @palette.length
      @palette << [@swatch, @swatch3]
      assert_equal initial_length + 2, @palette.length
      assert_equal @palette[1], @swatch3
    end

    def test_adding_swatch_data_creates_a_new_swatch
      @palette << [100, 200, 50]
      assert_equal @swatch, @palette[0]
      @palette << [[10, 20, 30], [40, 50, 60]]
      assert_equal @swatch3, @palette[2]
    end

    def test_all_gets_all_swatches
      assert_equal @palette.all, []
    end

    def test_brackets_get_swatch_by_index
      @palette << @swatch
      assert_equal @swatch, @palette[-1]
    end

    def test_swatches_extends_each
      output = []
      @palette << [@swatch1, @swatch2]
      @palette.each { |swatch| output << swatch }
      assert_equal output, @palette.all
    end
  end
end
