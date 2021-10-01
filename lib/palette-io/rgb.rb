# frozen_string_literal: true

require 'palette-io'
module PaletteIO
  # Appends assignment and conversion methods for RGB color_space
  class Swatch
    def to_rgb
      case @color_space
      when :hsb
        hsb_to_rgb
      when :hsl
        hsl_to_rgb
      end
    end

    private

    def hsb_to_rgb
      h = values[0] # hue 0-360
      s = values[1] / 100.0 # saturation 0-100
      b = values[2] / 100.0 # brightness 0-100

      r = hsb_to_rgb_color(5.0, h, s, b)
      g = hsb_to_rgb_color(3.0, h, s, b)
      b = hsb_to_rgb_color(1.0, h, s, b)
      format_rgb(r, g, b)
    end

    def hsb_to_rgb_color(input, hue, sat, bright)
      hue_mod = hsb_hue_conversion(input, hue)
      bright * (1.0 - sat * [0, [hue_mod, 4.0 - hue_mod, 1].min].max)
    end

    def hsb_hue_conversion(input, hue)
      (input + hue / 60.0) % 6
    end

    def hsl_to_rgb
      h = @values[0]         # hue 0-360
      s = @values[1] / 100.0 # saturation 0-100
      l = @values[2] / 100.0 # lightness 0-100

      r = hsl_to_rgb_color(0, h, s, l)
      g = hsl_to_rgb_color(8, h, s, l)
      b = hsl_to_rgb_color(4, h, s, l)
      format_rgb(r, g, b)
    end

    def hsl_to_rgb_color(input, hue, sat, light)
      hue_mod = hsl_hue_conversion(input, hue)
      vibrance = sat * [light, 1 - light].min
      light - vibrance * [-1, [hue_mod - 3, [9 - hue_mod, 1].min].min].max
    end

    def hsl_hue_conversion(input, hue)
      (input + hue / 30.0) % 12
    end

    def format_rgb(red, green, blue)
      [format_rgb_value(red), format_rgb_value(green), format_rgb_value(blue)]
    end

    def format_rgb_value(rgb_value)
      (rgb_value * 255.0).round
    end
  end
end
