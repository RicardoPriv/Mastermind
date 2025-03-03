class Guess
  def initialize
    @guess = nil
  end

  def set_guess(guess)
    @guess = guess
  end

  def get_guess
    @guess
  end

  def provide_hint(password)
    catalogue = Hash.new(0)
    guess = get_guess

    # checks the occurences of misplaced guesses and add them to a hash
    password.each_with_index do |num, index|
      catalogue[num] += 1 if password[index] != guess[index]
    end

    hint = []

    # builds the hint
    (0..password.length - 1).each do |index|
      if guess[index] == password[index]
        hint.push('match')
      # if misplaced occurence and has not provided one misplaced too many
      # eg: pass - [ 5,4,3,2 ] | guess - [ 2,2,2,2 ]
      # without catalogue => [ mis,mis,mis,mis ]  | with catalogue => [ mis,abs,abs,abs ]
      elsif password.include?(guess[index]) && catalogue[guess[index]] > 0
        hint.push('misplaced')
        catalogue[guess[index]] -= 1
      else
        hint.push('absent')
      end
    end

    hint
  end
end
