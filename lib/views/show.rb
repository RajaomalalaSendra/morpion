require_relative "../app/board"
require_relative "../app/player"
require "colorize"

class Show
	attr_reader :player1, :player2

  def show_player
    # Creation des joueurs
    print 'Nom du joueur 1 : '.colorize(:color => :green, :background => :white)
    @player1 = Player.new(gets.chomp.to_s, 1)
    print 'Nom du joueur 2 : '.colorize(:color => :green, :background => :white)
    @player2 = Player.new(gets.chomp.to_s, 2)
  end
  def player1
  	@player1
  end
  def player2
  	@player2
  end
end