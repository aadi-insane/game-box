class NumberGuessingGame
  def play
    puts "Welcome to Number Guessing Game!"
    puts "I'm thinking of a number between 1 and 100."
    
    secret_number = rand(1..100)
    attempts = 0
    max_attempts = 7
    
    while attempts < max_attempts
      print "Enter your guess: "
      guess = gets.chomp.to_i
      attempts += 1
      
      if guess == secret_number
        puts "🎉 Congratulations! You guessed it in #{attempts} attempts!"
        return
      elsif guess < secret_number
        puts "Too low! Try again."
      else
        puts "Too high! Try again."
      end
      
      puts "Attempts remaining: #{max_attempts - attempts}"
    end
    
    puts "💀 Game over! The number was #{secret_number}."
  end
end