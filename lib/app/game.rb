require "colorize"
require_relative "board"
require_relative "boardcase"
require_relative "player"

class Game
 def start_game
  puts "Welcome to my Tic Tac Toe game!                              ".colorize(:color => :green, :background => :white)
  puts "To place your X on the grid, enter the location (ex--a1, b3).".colorize(:color => :green, :background => :white)
  puts "To quit, enter q at any time                                 ".colorize(:color => :green, :background => :white)
 end
 def run_game
    board = Board.new
    board.new_board
    while true
      board.print_grid
      Player.user_one_turn
      Player.user_two_turn
    end
  end
end