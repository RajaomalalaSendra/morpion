# The class player for creating a new player
require_relative "boardcase"
require_relative "board"
class Player
	attr_accessor :a1, :a2, :a3, :b1, :b2, :b3, :c1, :c2, :c3
	attr_reader :name, :value
  # To initialize a new player
  def initialize(name, value)
    @name = name.capitalize
    @value = value
  end
  def squares
    [@a1, @a2, @a3, @b1, @b2, @b3, @c1, @c2, @c3]
  end
  def self.win_combos 
    [[@a1, @a2, @a3],
    [@a1, @b2, @c3],
    [@a1, @b1, @c1],
    [@b1, @b2, @b3],
    [@c1, @c2, @c3],
    [@c1, @b2, @a3],
    [@a2, @b2, @c2],
    [@a3, @b3, @c3]]
  end
	def self.user_one_turn
	  boardcase = BoardCase.new
	  board = Board.new
	  user_choice_hash = {"a1" => @a1,
	                      "a2" => @a2,
	                      "a3" => @a3,
	                      "b1" => @b1,
	                      "b2" => @b2,
	                      "b3" => @b3,
	                      "c1" => @c1,
	                      "c2" => @c2,
	                      "c3" => @c3}
	                    

	  puts "Please enter you choice #{@name}:"
	  user_choice = gets.chomp.downcase
	  user_choice_hash.each do |choice, square|
	    if user_choice == choice 
	      if BoardCase.check_validity(square)
	        square.sub!(" ", "X")
	        puts square
	        board.print_grid
	        puts user_choice
	      end
	    elsif user_choice == "q" or user_choice == "quit"
	      exit
	    end
	  end
	  boardcase.check_for_winner
	end

	def self.user_two_turn
	  board = Board.new
	  user_choice_hash = {"a1" => @a1,
	                      "a2" => @a2,
	                      "a3" => @a3,
	                      "b1" => @b1,
	                      "b2" => @b2,
	                      "b3" => @b3,
	                      "c1" => @c1,
	                      "c2" => @c2,
	                      "c3" => @c3}
	                    

	  puts "Please enter you choice #{@name}"
	  user_choice = gets.chomp.downcase
	  user_choice_hash.each do |choice, square|
	    if user_choice == choice 
	      if BroadCast.check_validity(square)
	        square.sub!(" ", "O")
	        board.print_grid
	      end
	    elsif user_choice == "q" or user_choice == "quit"
	      exit
	    end
	  end
	  boardcase.check_for_winner
  end
end