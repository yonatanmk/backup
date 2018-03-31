class NoEmailError < StandardError
end

class UserAccountValidator
  attr_reader :email, :username, :name
  def initialize(args)
    @email = args[:email]
    @username = args[:username]
    @name = args[:name]
    if !@email
      raise NoEmailError, 'No Email'
    elsif !@username
      raise 'No Username'
    elsif !@email.include?('@')
      raise 'Invalid Email'
    end
  end
end

# a = UserAccountValidator.new({ username: 'f'})
