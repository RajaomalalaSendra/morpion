# The class player for creating a new player

class Player
	attr_reader :name, :value

  def initialize(name, value)
    @name = name.upcase
    @value = value
  end
  def get
  	print 'Nom du joueur 1 : '
  	player1 = Player.new(gets.chomp.to_s, 1)
  	print 'Nom du joueur 2 : '
  	player2 = Player.new(gets.chomp.to_s, 2)
  end
end