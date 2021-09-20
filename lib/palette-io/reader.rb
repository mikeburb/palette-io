# frozen_string_literal: true

require 'palette-io'
require 'palette-io/aco'

module PaletteIO
  # Utility for reading palette files. Specific formats appended seperately.
  class Reader
    class << self
      def open(file_path)
        format = file_path.match(/\.\w{3,}\z/)[0][1..-1]
        unless valid_file_types.include?(format)
          raise TypeError, "\"#{format}\" is An Invalid Palette File Format"
        end

        get_palette(file_path, format)
      end

      private

      def get_palette(file_path, format)
        return nil unless File.exist?(file_path)

        open_file(file_path, format)
      end

      def open_file(file_path, format)
        case format
        when 'aco'
          read_aco_file(file_path)
        end
      end

      def valid_file_types
        ['aco']
      end
    end
  end
end
