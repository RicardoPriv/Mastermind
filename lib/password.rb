class Password
  PASSWORD_LENGTH = 4

  def initialize
    @password = nil
  end

  def set_password(array)
    @password = array
  end

  def get_password
    @password
  end

  def generate_new_password!(options)
    password = []

    (1..PASSWORD_LENGTH).each do |_i|
      password.push(rand(options) + 1)
    end

    set_password(password)
  end
end
