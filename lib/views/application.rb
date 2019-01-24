require "colorize"
require_relative "../app/game"
require_relative "show"
class Application
  def perform
    # Creation partie
  my_game = Game.new
  # To get the two new players
  my_game.start_game
  get_players = Show.new.show_player
  player1 = get_players[:player1]
  player2 = get_players[:player2]
  my_game.run_game
  end
end


Application.new.perform