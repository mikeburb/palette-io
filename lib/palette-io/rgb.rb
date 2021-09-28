# frozen_string_literal: true

require 'palette-io'
module PaletteIO
  # Appends assignment and conversion methods for RGB color_space
  class Swatch

    private

    def as_rgb(rgb_values)
      @values = []
      rgb_values.each { |rgb_value| @values << (rgb_value.to_i) }
      @color_space = :rgb
    end

    def as_rgb16(rgb_values)
      @values16 = []
      rgb_values.each { |rgb_value| @values16 << (rgb_value.to_i) }
      @color_space = :rgb
    end
  end
end
