require "colorize"
require_relative "../app/board"
require_relative "../app/game"
require_relative "../app/player"
require_relative "../app/boardcase"
require_relative "show"
class Application
  def perform
    # Creation partie
  my_game = Game.new
  my_game.initialize_game

  # Creation du board
  my_board = Board.new

  # Creation des cases du jeu (vide)
  1.upto(9) { |id| my_board.add_case(BoardCase.new(id)) }
  # To get the two new players
  get_players = Show.new.show_player
  player1 = get_players[:player1]
  player2 = get_players[:player2]
  # display the board 
  my_board.display_board
  # Boucle du jeu
  game_turn(my_game, player1, player2, my_board)
  end
end


Application.new.perform