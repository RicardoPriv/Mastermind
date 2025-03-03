require 'colorize'

module Colour
  AVAILABLE_COLORS = %i[red green yellow magenta cyan white]

  def add_colour_passcode(passcode)
    out_string = ''

    passcode.chars.each_with_index do |char, _index|
      if char.match?(/\A\d+\z/)
        color = AVAILABLE_COLORS[char.to_i % AVAILABLE_COLORS.length]
        out_string += "#{char.colorize(color)} "
      end
    end

    out_string.strip # Strip to remove any trailing space
  end

  def add_colour_hint(hint)
    out_string = ''

    hint.split(' ').map do |element|
      if element == 'match'
        out_string += element.colorize(:green) + ' '
      elsif element == 'misplaced'
        out_string += element.colorize(:yellow) + ' '
      elsif element == 'absent'
        out_string += element.colorize(:red) + ' '
      end
    end

    out_string.strip
  end
end
