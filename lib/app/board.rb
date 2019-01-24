require_relative "boardcase"

class Board
  attr_accessor :a1, :a2, :a3, :b1, :b2, :b3, :c1, :c2, :c3
  def initialize
    @a1 = " "
    @a2 = " "
    @a3 = " "
    @b1 = " "
    @b2 = " "
    @b3 = " "
    @c1 = " "
    @c2 = " "
    @c3 = " "
  end
  def board
    
    [@a1, @a2, @a3, @b1, @b2, @b3, @c1, @c2, @c3]
  
  end
  def the_grid
    puts
    puts "   1   2   3"
    puts "A  #{@a1} | #{@a2} | #{@a3} " 
    puts "  ---|---|---"
    puts "B  #{@b1} | #{@b2} | #{@b3} "
    puts "  ---|---|---"
    puts "C  #{@c1} | #{@c2} | #{@c3} "
    puts  
  end
  def user_choice(the_square)
    user_choice_hash = {"a1" => @a1,
                      "a2" => @a2,
                      "a3" => @a3,
                      "b1" => @b1,
                      "b2" => @b2,
                      "b3" => @b3,
                      "c1" => @c1,
                      "c2" => @c2,
                      "c3" => @c3}
      user_choice_hash.each do |choice, square|
      if user_choice == choice 
        if check_validity(square)
          square.sub!(" ", "X")
          the_grid
        end
        elsif user_choice == "q" or user_choice == "quit"
         exit
       end
     end
end 
end