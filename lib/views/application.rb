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
  # Creation du board
  my_board = Board.new
  # To get the two new players
  get_players = Show.new.show_player
  player1 = get_players[:player1]
  player2 = get_players[:player2]

  puts my_board.the_grid
  end
end


Application.new.perform