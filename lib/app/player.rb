# The class player for creating a new player
require_relative "boardcase"
class Player
	attr_reader :name, :value
	boardcase = BoardCase.new
  # To initialize a new player
  def initialize(name, value)
    @name = name.capitalize
    @value = value
  end
	def user_one_turn
	  user_choice_hash = {"a1" => @a1,
	                      "a2" => @a2,
	                      "a3" => @a3,
	                      "b1" => @b1,
	                      "b2" => @b2,
	                      "b3" => @b3,
	                      "c1" => @c1,
	                      "c2" => @c2,
	                      "c3" => @c3}
	                    

	  puts "Please choose a square:"
	  user_choice = gets.chomp.downcase
	  user_choice_hash.each do |choice, square|
	    if user_choice == choice 
	      if boardcase.check_validity(square)
	        square.sub!(" ", "X")
	        print_grid
	      end
	    elsif user_choice == "q" or user_choice == "quit"
	      exit
	    end
	  end
	  boardcase.check_for_winner
	end

	def user_two_turn
	  user_choice_hash = {"a1" => @a1,
	                      "a2" => @a2,
	                      "a3" => @a3,
	                      "b1" => @b1,
	                      "b2" => @b2,
	                      "b3" => @b3,
	                      "c1" => @c1,
	                      "c2" => @c2,
	                      "c3" => @c3}
	                    

	  puts "Please choose a square:"
	  user_choice = gets.chomp.downcase
	  user_choice_hash.each do |choice, square|
	    if user_choice == choice 
	      if boardcase.check_validity(square)
	        square.sub!(" ", "O")
	        print_grid
	      end
	    elsif user_choice == "q" or user_choice == "quit"
	      exit
	    end
	  end
	  boardcase.check_for_winner
  end
end