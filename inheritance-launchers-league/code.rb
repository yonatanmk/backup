module SuperHero
  def initialize(public_identity, secret_identity)
    @public_identity = public_identity
    @secret_identity = secret_identity
  end

  def public_identity
    @public_identity
  end

  def species
    "Human"
  end

  def home
    "Earth"
  end

  def fans_per_thousand
    500
  end

  def powers
    "humor"
  end

  def weakness
    "ice cream"
  end

  def backstory
    "is sad"
  end

  def speed_in_mph
    60
  end

  def health
    100
  end

  def psychic?
    false
  end
end

class Speedster
  include SuperHero
  def speed_in_mph
    super * 1000
  end
end

class Brawler
  include SuperHero
  def health
    super * 20
  end
end

class Detective
  include SuperHero
  def weakness
    @secret_identity
  end

  def speed_in_mph
    super / 6
  end
end

class Demigod
  include SuperHero
  def home
    "Cosmic Plane"
  end
end

class JackOfAllTrades
  include SuperHero
  def species
    "Alien"
  end

  def home
    "Venus"
  end

  def psychic?
    true
  end
end

class WaterBased
  include SuperHero

  def fans_per_thousand
    super / 100
  end

  def home
    "#{super}'s Oceans"
  end

  def psychic?
    true
  end
end
