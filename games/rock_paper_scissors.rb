class RockPaperScissorsGame
  def play
    puts "Welcome to Rock, Paper, Scissors!"
    choices = ['rock', 'paper', 'scissors']
    player_score = 0
    computer_score = 0
    
    5.times do |round|
      puts "\nRound #{round + 1}/5"
      print "Choose (rock/paper/scissors): "
      player_choice = gets.chomp.downcase
      
      unless choices.include?(player_choice)
        puts "Invalid choice! Skipping round."
        next
      end
      
      computer_choice = choices.sample
      puts "Computer chose: #{computer_choice}"
      
      result = determine_winner(player_choice, computer_choice)
      puts result
      
      if result.include?("win")
        player_score += 1
      elsif result.include?("lose")
        computer_score += 1
      end
      
      puts "Score - You: #{player_score}, Computer: #{computer_score}"
    end
    
    puts "\n" + "="*30
    if player_score > computer_score
      puts "🎉 You won the game!"
    elsif computer_score > player_score
      puts "💀 Computer won the game!"
    else
      puts "🤝 It's a tie!"
    end
  end
  
  private
  
  def determine_winner(player, computer)
    return "It's a tie!" if player == computer
    
    winning_combinations = {
      'rock' => 'scissors',
      'paper' => 'rock',
      'scissors' => 'paper'
    }
    
    if winning_combinations[player] == computer
      "You win this round!"
    else
      "You lose this round!"
    end
  end
end