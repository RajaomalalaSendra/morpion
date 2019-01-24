require "colorize"
require_relative "../app/board"
require_relative "../app/game"
require_relative "../app/player"
require_relative "../app/boardcase"
class Application
  def perform
    # Creation partie
  my_game = Game.new
  my_game.initialize_game

  # Creation du board
  my_board = Board.new

  # Creation des cases du jeu (vide)
  1.upto(9) { |id| my_board.add_case(BoardCase.new(id)) }

  # Creation des joueurs
  print 'Nom du joueur 1 : '.green
  player1 = Player.new(gets.chomp.to_s, 1)
  print 'Nom du joueur 2 : '.green
  player2 = Player.new(gets.chomp.to_s, 2)
  my_board.display_board
  # Boucle du jeu
  game_turn(my_game, player1, player2, my_board)

  end
end


Application.new.perform