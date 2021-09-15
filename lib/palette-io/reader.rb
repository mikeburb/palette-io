# frozen_string_literal: true

require 'palette-io'

module PaletteIO
  # Utility for reading palette files. Specific formats appended seperately.
  class Reader
    class << self
      def open(file_path)
        format = file_path.match(/\.\w{3,}\z/)[0][1..-1]
        unless valid_file_types.include?(format)
          raise TypeError, "\"#{format}\" is An Invalid Palette File Format"
        end

        open_file(file_path, format)
      end

      private

      def open_file(file_path, _format)
        return nil unless File.exist?(file_path)

        palette = Palette.new
        File.open(file_path)
        palette
      end

      def valid_file_types
        ['aco']
      end
    end
  end
end
