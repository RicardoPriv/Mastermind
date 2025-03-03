require_relative "password"
require_relative "guess"
require_relative "colour"

include Colour

module Gameplay
  TOTAL_COLORS = 6
  END_KEY = "e"
  MAX_ATTEMPTS = 12

  def play
    print_instructions

    password = Password.new
    guess = Guess.new
    attempts = 0
    matched = false
    password.generate_new_password!(TOTAL_COLORS)

    until matched or guess.get_guess == END_KEY or attempts == MAX_ATTEMPTS
      guess.set_guess(get_input(END_KEY))
      
      unless guess.get_guess == END_KEY
        hint = guess.provide_hint(password.get_password)
        print_unmatched_msg(guess.get_guess, hint)
      end

      matched = guess_match_password(guess.get_guess, password.get_password)
      attempts += 1
    end
    
    print_game_over_message(matched, password)
  end

  def guess_match_password(guess, password) 
    return true if (guess == password) 
    false
  end

  def get_input(cancel_key)
    password_guess = Array.new
    i = 0

    while i < Password::PASSWORD_LENGTH do    
      puts
      print("Enter in guess for position #{i + 1}:")
      guess = gets.chomp

      return cancel_key if guess == cancel_key
      
      until (guess.match?(/\A\d+\z/) && (1..TOTAL_COLORS).include?(guess.chomp.to_i)) || (guess == "x" && i > 0)
        print("Invalid choice, please enter a valid choice for position #{i + 1} [1 to #{TOTAL_COLORS}]:")
        guess = gets.chomp
        return cancel_key if guess == cancel_key
      end

      if (guess == "x" && i > 0)
        i -= 1        
        redo
      end

      password_guess[i] = guess.chomp.to_i
      i += 1
    end

    return password_guess
  end

  def print_unmatched_msg(guess, hint)
    puts "---"
    puts ("User guessed: | " +  Colour.add_colour_passcode(guess.join(" ")).gsub(" ", " | ") + " |")
    puts ("Hint provided: | " + Colour.add_colour_hint(hint.join(" ")).gsub(" ", " | ") + " |")
    puts "---"
  end

  def print_instructions
    puts "Welcome to Mastermind!"
    puts "The goal of the game is to guess the secret code."
    puts "The code consists of #{Password::PASSWORD_LENGTH} numbers, each between 1 and #{TOTAL_COLORS}."
    puts "Each time you guess, you'll receive a hint:"
    puts " - 'match' means the number and position are correct."
    puts " - 'misplaced' means the number is correct but in the wrong position."
    puts " - 'absent' means the number is not in the code."
    puts "You can type 'x' to go back to the previous guess or press 'e' to exit at any time."
    puts "You have a maximum of #{MAX_ATTEMPTS} attempts to guess the code."
    puts "\nGood luck!"
    puts "---"
  end

  def print_game_over_message(matched, password)
    if matched
      puts "Congratulations, you guessed the correct code!"
    else
      string_password = password.get_password.join(" ")
      puts "Game over! The correct code was #{Colour.add_colour_passcode(string_password)}."
    end
    puts "---"
    puts "Thank you for playing Mastermind! Goodbye."
  end
end