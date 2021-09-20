# frozen_string_literal: true

$LOAD_PATH << File.expand_path('../lib', File.dirname(__FILE__))

require 'test/unit'
require 'palette-io'

module PaletteIO
  # Test for Reader Class
  class TestReader < Test::Unit::TestCase
    def setup; end

    def test_reader_checks_filetype
      assert_raise TypeError do
        Reader.open('doesntexist.fai')
      end
    end

    def test_reader_returns_nil_on_invalid_path
      assert_equal nil, Reader.open('doesntexist.aco')
    end

    def test_reader_valid_file_path_returns_palette
      assert_equal Palette, Reader.open('test-files/test-palette.aco').class
    end
  end
end
