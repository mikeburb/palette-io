# frozen_string_literal: true

require 'palette-io'
module PaletteIO
  # Appends assignment and conversion methods for RGB color_space
  class Swatch

    private

    def as_hsb(hsb_values)
      @values = []
      hsb_values.each { |hsb_value| @values << (hsb_value.to_i) }
      @color_space = :hsb
    end

    def as_hsb16(hsb_values)
      @values16 = []
      hsb_values.each { |hsb_value| @values16 << (hsb_value.to_i) }
      @color_space = :hsb
    end
  end
end
