class Password
  def initialize
    @password = nil
  end

  def set_password(array)
    @password = array
  end

  def get_password
    return @password
  end

  def generate_new_password!(length, options)
    password = Array.new

    (1..length).each do |i|
      password.push(rand(options) + 1)
    end

    set_password(password)
  end
end