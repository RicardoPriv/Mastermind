require "colorize"

module Colour
  AVAILABLE_COLORS = [:red, :green, :yellow, :magenta, :cyan, :white]

  def add_colour_passcode(passcode)
    out_string = ""
  
    p passcode
    passcode.chars.each_with_index do |char, index|
      if char.match?(/\A\d+\z/)
        color = AVAILABLE_COLORS[char.to_i % AVAILABLE_COLORS.length]
        out_string += "#{char.colorize(color)} " 
      end
    end
  
    return out_string.strip  # Strip to remove any trailing space
  end

  def add_colour_hint(hint)
    out_string = ""

    hint.split(" ").map do |element|
      case
      when element == "match"
        out_string += element.colorize(:green) + " "
      when element == "misplaced"
        out_string += element.colorize(:yellow) + " "
      when element == "absent"
        out_string += element.colorize(:red) + " "
      end
    end

    return out_string.strip
  end
end