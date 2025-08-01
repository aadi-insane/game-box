class CoinTossGame
  def play
    puts "Welcome to Coin Toss Game!"
    correct_guesses = 0
    total_tosses = 0
    
    loop do
      print "\nGuess the coin toss (heads/tails) or 'quit' to exit: "
      guess = gets.chomp.downcase
      break if guess == 'quit'
      
      unless ['heads', 'tails'].include?(guess)
        puts "Invalid guess! Please enter 'heads' or 'tails'."
        next
      end
      
      result = ['heads', 'tails'].sample
      total_tosses += 1
      
      puts "🪙 The coin landed on: #{result.upcase}!"
      
      if guess == result
        puts "🎉 Correct! You guessed right!"
        correct_guesses += 1
      else
        puts "💀 Wrong! Better luck next time!"
      end
      
      accuracy = (correct_guesses.to_f / total_tosses * 100).round(1)
      puts "Score: #{correct_guesses}/#{total_tosses} (#{accuracy}% accuracy)"
    end
    
    puts "Final score: #{correct_guesses} correct out of #{total_tosses} tosses!"
  end
end