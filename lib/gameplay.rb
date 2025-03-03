require_relative "password"
require_relative "guess"

module Gameplay
  PASSWORD_LENGTH = 4
  TOTAL_COLORS = 6
  END_KEY = "e"
  MAX_ATTEMPTS = 12

  def play
    password = Password.new
    guess = Guess.new
    attempts = 0

    password.generate_new_password!(PASSWORD_LENGTH, TOTAL_COLORS)
    p password
    matched = false

    until matched or guess.get_guess == END_KEY or attempts == MAX_ATTEMPTS
      guess.set_guess(get_input(END_KEY))
      
      unless guess.get_guess == END_KEY
        hint = guess.provide_hint(password.get_password)
        print_unmatched_msg(guess.get_guess, hint)
      end

      matched = guess_match_password(guess.get_guess, password.get_password)
      attempts += 1
    end
    
    puts "\ngame over\n"
    if matched
      print("Congratulations, you won\n")
    else
      print("You lose\n")
    end
  end

  def guess_match_password(guess, password) 
    return true if (guess == password) 
    false
  end

  def get_input(cancel_key)
    password_guess = Array.new
    i = 0

    while i < PASSWORD_LENGTH do    
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
    print "\n---\n"
    print ("User guessed:" + guess.to_s + "\n" + "Hint provided:" + hint.to_s)
    print "\n---\n"
  end
end