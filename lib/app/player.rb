# The class player for creating a new player

class Player
	attr_reader :name, :value

  def initialize(name, value)
    @name = name.upcase
    @value = value
  end
end