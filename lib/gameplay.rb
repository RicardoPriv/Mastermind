require_relative "password"

module Gameplay
  def play
    password = Password.new
    password.setPassword([1, 5, 3, 2])
    p password
  end
end