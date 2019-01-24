require "colorize"
class Game
  attr_accessor :a1, :a2, :a3, :b1, :b2, :b3, :c1, :c2, :c3
  @win_game = 
  [[@a1, @a2, @a3],
    [@a1, @b2, @c3],
    [@a1, @b1, @c1],
    [@b1, @b2, @b3],
    [@c1, @c2, @c3],
    [@c1, @b2, @a3],
    [@a2, @b2, @c2],
    [@a3, @b3, @c3]]

  def initialize
    puts "Welcome to the tip to game".colorize({:background => :white, :color => :green})
  end
  def the_winner
    @win_game.each do |combos| 
    if combos[0] == "O" && combos[1] == "O" && combos[2] == "O"
      puts "#{player1} wins! Good job!"
      exit 
    elsif combos[0] == "X" && combos[1] == "X" && combos[2] == "X"
      puts "#{player2} win! Good job!"
      exit
  end
    
  
end