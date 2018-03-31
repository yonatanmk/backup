module PartyGoer

  def self.included(party_goer)
    party_goer.extend Invited
  end

  def drink
    @drink_count ||= 0
    if @drink_count < 3
      @drink_count += 1
      return true
    else
      return false
    end
  end

  def cause_havoc
    raise PersonalizedHavocError, "You should define this yourself!"
  end

  def sing
    return "LIVIN ON A PRAYER!"
  end

  module Invited
    def invited?
      return true
    end
  end

end

class PersonalizedHavocError < StandardError
  def initialize msg
    super(msg)
  end
end
