require_relative "boardcase"
require 'pry'
class Board
attr_accessor :group_of_case

  # Initialize le groupe (ne possede pas de case)
  def initialize(initialize_case = [])
    @group_of_case = initialize_case
  end

  # Ajoute une case au groupe
  def add_case(new_case)
    @group_of_case.push(new_case)
  end

  # Affichage des cases
  def display_board
    # On observe chaque case du groupe de case
    # L'utilisateur rentre une id de case, print ou put la valeur selon l'id
    # X ou O selon la case.value qui a etait modifie dans check_case_value
    @group_of_case.each do |my_case|
      case my_case.int
      when 1
        (my_case.case % 3).zero? ? (puts 'O') : (print 'O')
      when 2
        (my_case.case % 3).zero? ? (puts 'X') : (print 'X')
      else
        (my_case.case % 3).zero? ? (puts ' ') : (print ' ')
      end
      (print ' | ') unless (my_case.case % 3).zero?
      (puts '----------') if (my_case.case % 3).zero? && my_case.case != 9
    end
  end

  # Verifie si la case est vide, si non change la valeur de la case
  # La valeur de la case peut prendre 1 ou 2 selon quel joueur joue
  def check_case_value(my_case_id, my_player)
    @group_of_case.map! do |my_case|
      if my_case.case == my_case_id
        if my_case.int.zero?
          my_player == 1 ? (my_case.int = 1) : (my_case.int = 2)
        else
          p 'La case est deja prise!'
          return false
        end
      end
      my_case
    end
  end

  # Pour la comparaison des cases, offset positif (pour l'id)
  def select_positive(my_case_to_check, offset)
    (@group_of_case.select { |my_case| my_case.case == my_case_to_check + offset })[0].to_s
  end

  # Pour la comparaison des cases, offset negatif (pour l'id)
  def select_negative(my_case_to_check, offset)
    (@group_of_case.select { |my_case| my_case.case == my_case_to_check - offset })[0].to_s
  end

  # Verifie si il y a une victoire
  def check_victory(my_case_to_check)
    result = 0
    my_case_check_id = (@group_of_case.select { |my_case| my_case.case == my_case_to_check})[0].to_s

    # Verification des lignes
    # case A1, B1, C1
    comparaison_array = ["A1", "B1", "C1"]
    if comparaison_array.include?(my_case_to_check)
      if my_case_check_id == select_positive(my_case_to_check, 1) && my_case_check_id == select_positive(my_case_to_check, 2)
        result += 2
      end
    end
    # Case A2, B2, C2
    comparaison_array = ["A2", "B2", "C2"]
    if comparaison_array.include?(my_case_to_check)
      if my_case_check_id == select_negative(my_case_to_check, 1) && my_case_check_id == select_positive(my_case_to_check, 1)
        result += 2
      end
    end
    # Case A1, B3, C3
    comparaison_array = ["A3", "B3", "C3"]
    if comparaison_array.include?(my_case_to_check)
      if my_case_check_id == select_negative(my_case_to_check, 1) && my_case_check_id == select_negative(my_case_to_check, 2)
        result += 2
      end
    end
    return true if result == 2
    result = 0

    # Verification des colonnes
    # case 1 / 2 / 3
    comparaison_array = ["A1", "A2", "A3"]
    if comparaison_array.include?(my_case_to_check)
      if my_case_check_id == select_positive(my_case_to_check, 3) && my_case_check_id == select_positive(my_case_to_check, 6)
        result += 2
      end
    end
    # Case 4 / 5 / 6
    comparaison_array = ["B1", "B2", "B3"]
    if comparaison_array.include?(my_case_to_check)
      if my_case_check_id == select_negative(my_case_to_check, 3) && my_case_check_id == select_positive(my_case_to_check, 3)
        result += 2
      end
    end
    # Case 7 / 8 / 9
    comparaison_array = ["C1", "C2", "C3"]
    if comparaison_array.include?(my_case_to_check)
      if my_case_check_id == select_negative(my_case_to_check, 3) && my_case_check_id == select_negative(my_case_to_check, 6)
        result += 2
      end
    end
    return true if result == 2
    result = 0

    # Verification diagonale 159
    # Case 1
    if my_case_to_check == "A1"
      if my_case_check_id == select_positive(my_case_to_check, 4) && my_case_check_id == select_positive(my_case_to_check, 8)
        result += 2
      end
    end
    # Case 5
    if my_case_to_check == "B2"
      if my_case_check_id == select_negative(my_case_to_check, 4) && my_case_check_id == select_positive(my_case_to_check, 4)
        result += 2
      end
    end
    # Case 9
    if my_case_to_check == "C3"
      if my_case_check_id == select_negative(my_case_to_check, 4) && my_case_check_id == select_negative(my_case_to_check, 8)
        result += 2
      end
    end
    return true if result == 2
    result = 0

    # Verification diagonale 357
    # Case 3
    if my_case_to_check == "A3"
      if my_case_check_id == select_positive(my_case_to_check, 2) && my_case_check_id == select_positive(my_case_to_check, 4)
        result += 2
      end
    end
    # Case 5
    if my_case_to_check == "B2"
      if my_case_check_id == select_negative(my_case_to_check, 2) && my_case_check_id == select_positive(my_case_to_check, 2)
        result += 2
      end
    end
    # Case 7
    if my_case_to_check == "C1"
      if my_case_check_id == select_negative(my_case_to_check, 2) && my_case_check_id == select_negative(my_case_to_check, 4)
        result += 2
      end
    end

    true if result == 2
  end
end