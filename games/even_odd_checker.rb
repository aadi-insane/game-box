class EvenOddChecker
  def play
    puts "Welcome to Even or Odd Checker Game!"
    puts "Guess if the random number will be even or odd!"
    
    score = 0
    rounds = 0
    
    loop do
      print "\nGuess (even/odd) or 'quit' to exit: "
      guess = gets.chomp.downcase
      break if guess == 'quit'
      
      unless ['even', 'odd'].include?(guess)
        puts "Invalid guess! Please enter 'even' or 'odd'."
        next
      end
      
      number = rand(1..100)
      actual = number.even? ? 'even' : 'odd'
      rounds += 1
      
      puts "🎲 Random number: #{number} (#{actual.upcase})"
      
      if guess == actual
        puts "🎉 Correct! You guessed right!"
        score += 1
      else
        puts "💀 Wrong! The number was #{actual}."
      end
      
      accuracy = (score.to_f / rounds * 100).round(1)
      puts "Score: #{score}/#{rounds} (#{accuracy}% accuracy)"
    end
    
    puts "Final score: #{score} correct out of #{rounds} rounds!"
  end
end