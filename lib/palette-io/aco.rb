# frozen_string_literal: true

require 'palette-io'

module PaletteIO
  # .aco extentsion for Reader class
  class Reader
    class << self

      private

      def read_aco_file(file_path)
        palette = Palette.new
        file = File.open(file_path, 'rb')
        puts file_path
        parse_aco(file, palette)
        palette
      end

      def parse_aco(file, palette)
        file.seek(2)
        length = file.read(2).unpack1('S>')
        length.times do
          swatch = file.read(10).unpack('S>5')
          color_space = aco_color_space(swatch[0])
          palette.add(swatch[1], swatch[2], swatch[3], color_space)
        end
      end

      def aco_color_space(color_space_value)
        case color_space_value
        when 0
          :rgb16
        when 1
          :hsb16
        when 2
          :cmyk16
        when 7
          :lab16
        when 8
          :grayscale16
        end
      end
    end
  end
end
