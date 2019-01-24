require "colorize"
require_relative "board"
require_relative "boardcase"
require_relative "player"

class Game
  board = Board.new
 def start_game
  puts "Welcome to my Tic Tac Toe game!"
  puts "To place your X on the grid, enter the location (ex--a1, b3)."
  puts "To quit, enter q at any time"
 end
 def run_game
  new_board
  while true
    board.print_grid
    user_one_turn
    user_two_turn
  end
end