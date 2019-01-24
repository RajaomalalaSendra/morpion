require 'colorize'
require_relative "player"
require_relative "board"

class Game
  attr_accessor :nb_tour

  # On initialize la partie
  def initialize_game
    a = "*" * 100
    puts "#{a}".colorize(:color => :red, :background => :white)
    puts "#{a}".colorize(:color => :red, :background => :white)
    puts'Bienvenu dans le Tic-Tac-Toe !                                                                      '.colorize(:color => :light_blue, :background => :white)
    puts'Le plateau se décrit de la manière suivante :                                                       '.colorize(:color => :light_blue, :background => :white)
    puts'                A1 | B1 | C1                                                                        '.colorize(:color => :green, :background => :white)
    puts'                ------------                                                                        '.colorize(:color => :green, :background => :white)
    puts'                A2 | B2 | C2                                                                        '.colorize(:color => :green, :background => :white)
    puts'                ------------                                                                        '.colorize(:color => :green, :background => :white)
    puts'                A3 | B3 | C3                                                                        '.colorize(:color => :green, :background => :white)
    puts'A chaque tour, un des joueurs doit séléctionner la case ou il veut rentrer son symbole.             '.colorize(:color => :light_blue, :background => :white)
    puts'Le premier joueur est les ronds, le second est les croix.                                           '.colorize(:color => :light_blue, :background => :white)
    puts'Le jeu commence une fois que chaque joueur a inscrit son prénom.                                    '.colorize(:color => :light_blue, :background => :white)
    puts"#{a}".colorize(:color => :red, :background => :white)
    puts"#{a}".colorize(:color => :red, :background => :white)
    @nb_tour = 1
  end

  # On verifie si c'est la fin du jeu en fonction de : Numero de tour == 5
  def check_end_game(number_game_turn)
    true if number_game_turn == 5
  end
end
############################################################

############################################################
# Methode #
# Defini un tour de jeu complet
def game_turn(game, player1, player2, board)
  1.upto(5) do |game_turn|
    # Joueur 1
    break if player_turn(player1, board) == true
    # On check la fin du game
    if game.check_end_game(game_turn) == true
      p 'Egalité !'
      break
    end
    # Joueur2
    break if player_turn(player2, board) == true
  end
  p 'Le jeu est fini!'
end

# Defini le tour d'un joueur
def player_turn(player, board)
  check_the_case = false
  while check_the_case == false
    our_array = ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3"]
    my_choice = ""
    while our_array.include?(my_choice) 
      my_choice = player.call_player
      if !our_array.include?(my_choice)
        p "Ce n'est pas une commande valide!"
      end
    end
    check_the_case = board.check_case_value(my_choice, player.to_s)
  end
  board.display_board
  if board.check_victory(my_choice) == true
    p "#{player.name} a gagné!"
    return true
  end    
end