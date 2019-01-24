# The class player for creating a new player

class Player
	attr_reader :name, :value
  # To initialize a new player
  def initialize(name, value)
    @name = name.upcase
    @value = value
  end
  # To call the turn of the player
  def call_player
    print "C'est à #{@name} de jouer : Choisissez une case à jouer entre 1 et 9 "
    gets.chomp.to_i
  end
end