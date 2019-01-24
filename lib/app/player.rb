# The class player for creating a new player

class Player
	attr_reader :name, :value
  # To initialize a new player
  def initialize(name, value)
    @name = name.capitalize
    @value = value
  end
  # To call the turn of the player
  def call_player
    print "C'est à #{@name} de jouer : Choisissez une case à jouer soit A1..A3, B1..B3 ou C1..C3"
    gets.chomp.to_s
  end
end