# The class player for creating a new player
require_relative "boardcase"
require_relative "board"
require "pp"
class Player
	attr_accessor :a1, :a2, :a3, :b1, :b2, :b3, :c1, :c2, :c3
	attr_reader :name, :value
	@user_choice_hash = {"a1" => @a1,
                      "a2" => @a2,
                      "a3" => @a3,
                      "b1" => @b1,
                      "b2" => @b2,
                      "b3" => @b3,
                      "c1" => @c1,
                      "c2" => @c2,
                      "c3" => @c3}
                    

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
	  puts "Please enter you choice #{:player1}:"
	  @user_choice = gets.chomp.downcase
	  @user_choice_hash.each do |choice, square|
	    if @user_choice.to_s == choice.to_s 
	      if BoardCase.check_validity(square)

	        square.sub!(" ", "X")
	        Board.print_grid
	      end
	    elsif @user_choice.to_s == "q" or @user_choice.to_s == "quit"
	      exit
	    end
	  end
	  BoardCase.check_for_winner
	end

	def self.user_two_turn
	  puts "Please enter you choice #{:player2}"
	  @user_choice = gets.chomp.downcase
	  @user_choice_hash.each do |choice, square|
	    if @user_choice.to_s == choice.to_s 
	    	return true
	      if BoardCase.check_validity(square)
	      	return true
	        square.sub!(" ", "O")
	        Board.print_grid
	      end
	    elsif @user_choice.to_s == "q" or @user_choice.to_s == "quit"
	      exit
	    end
	  end
	  BoardCase.check_for_winner
  end
end