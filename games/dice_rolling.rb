class DiceRollingGame
  def play
    puts "Welcome to Dice Rolling Game!"
    puts "Roll two dice and try to get a total of 7 or 11 to win!"
    
    wins = 0
    total_rolls = 0
    
    loop do
      print "\nPress Enter to roll dice (or 'quit' to exit): "
      input = gets.chomp.downcase
      break if input == 'quit'
      
      die1 = rand(1..6)
      die2 = rand(1..6)
      total = die1 + die2
      total_rolls += 1
      
      puts "🎲 Die 1: #{die1}, Die 2: #{die2}"
      puts "Total: #{total}"
      
      if total == 7 || total == 11
        puts "🎉 You win!"
        wins += 1
      elsif total == 2 || total == 3 || total == 12
        puts "💀 Snake eyes or boxcars! You lose!"
      else
        puts "Roll again!"
      end
      
      puts "Wins: #{wins}/#{total_rolls} (#{(wins.to_f/total_rolls*100).round(1)}%)"
    end
    
    puts "Final stats: #{wins} wins out of #{total_rolls} rolls!"
  end
end