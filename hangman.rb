require_relative('game')

phrase = "star wars"

puts "Welcome to Hangman"

while true

puts "\n1 - Play"
puts "2 - Enter phrase"
puts "3 - Exit"
puts "\nEnter selection"
print "> "
menu_selection = gets.chomp.downcase


  case menu_selection.to_i

    when 1
      lives = 5
      hangman = Game.new(phrase)
      print hangman.display_answers_so_far, " LIVES: #{lives}"

        while lives > 0
          if hangman.is_game_won
             puts "\n\nYou win!\n\n"
             exit
           else

          puts "\n "
          guess = hangman.next_turn

          if hangman.is_guess_correct(guess)
            hangman.update_answers_so_far(guess)
          else
            lives -= 1
          end
          print "\n", hangman.display_answers_so_far, " LIVES: #{lives}"
        end
      end
  

    when 2 
      puts "Enter new phrase: "
      print "> "
      phrase = gets.chomp.downcase

    when 3
      break
  end
  puts "\n\nYou Lose!\n\n" if lives = 0

end

