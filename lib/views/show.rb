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
    return params = { player1: @player1, player2: @player2 }
  end
  def show_iteraction_user
    puts "Please choose a square:"
    @user_choice = gets.chomp.downcase
    return the_user_choice = { :user_choice => @user_choice }
  end
end