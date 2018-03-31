
require_relative "../user_account_validator.rb"

describe UserAccountValidator do
  context "Valid Input:" do
    it "Doesnt raise error with valid input" do
      expect{UserAccountValidator.new({ username: 'f', name: 'f', email: 'y@gmail.com'})}.not_to raise_error
    end
  end

  context "Email:" do
    it "Raises NoEmailError when not given email" do
      expect{UserAccountValidator.new({ username: 'f', name: 'f'})}.to raise_error(NoEmailError, 'No Email')
    end

    it "Raises StandardError when given invalid email" do
      expect{UserAccountValidator.new({ username: 'f', name: 'f', email: 'ygmail.com'})}.to raise_error(StandardError, 'Invalid Email')
    end
  end

  context "Username:" do
    it "Raises StandardError when not given username" do
      expect{UserAccountValidator.new({ name: 'f', email: 'y@gmail.com'})}.to raise_error(StandardError, 'No Username')
    end
  end

end
