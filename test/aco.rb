# frozen_string_literal: true

$LOAD_PATH << File.expand_path('../lib', File.dirname(__FILE__))

require 'test/unit'
require 'palette-io'

module PaletteIO
  # Test for Reader Class (.aco files)
  class TestReader < Test::Unit::TestCase
    def setup
      @read_palette = Reader.open('test-files/test-palette.aco')
    end

    def test_reader_gets_correct_number_of_colors_from_aco_file
      assert_equal 4, @read_palette.length
    end

    def test_reader_gets_correct_color_space
      assert_equal :rgb, @read_palette[0].color_space
    end
  end
end
