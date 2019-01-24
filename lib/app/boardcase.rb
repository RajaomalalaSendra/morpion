# Creation of the broadcast
require_relative "player"
class BoardCase
	def self.check_for_winner 
	Player.win_combos.each do |combos| 
	    if combos[0] == "O" && combos[1] == "O" && combos[2] == "O"
	      puts "#{:player1} win! Good job!"
	      exit 
	    elsif combos[0] == "X" && combos[1] == "X" && combos[2] == "X"
	      puts "#{:player2} win! Good job!"
	      exit
	    end
	  end
	end
	def self.check_validity(square_availability)
      if square_availability == " "
        true
      else
        puts "That space is taken. Get your own!"
      end
    end
end