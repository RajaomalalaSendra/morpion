# Creation of the broadcast
class BoardCase
	def squares
      [@a1, @a2, @a3, @b1, @b2, @b3, @c1, @c2, @c3]
  	end
	def win_combos 
      [[@a1, @a2, @a3],
      [@a1, @b2, @c3],
	  [@a1, @b1, @c1],
	  [@b1, @b2, @b3],
	  [@c1, @c2, @c3],
	  [@c1, @b2, @a3],
	  [@a2, @b2, @c2],
	  [@a3, @b3, @c3]]
  	end
	def check_for_winner 
	  win_combos.each do |combos| 
	    if combos[0] == "O" && combos[1] == "O" && combos[2] == "O"
	      puts "#{player1} win! Good job!"
	      exit 
	    elsif combos[0] == "X" && combos[1] == "X" && combos[2] == "X"
	      puts "#{player2} win! Good job!"
	      exit
	    end
	  end
	end
	def check_validity square_availability
      if square_availability == " "
        true
      else
        puts "That space is taken. Get your own!"
      end
    end
end