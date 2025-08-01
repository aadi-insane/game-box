class WordGuessGame
  def play
    puts "Welcome to Word Guess Game!"
    
    words = ['ruby', 'python', 'javascript', 'computer', 'programming', 'game', 'code', 'developer']
    secret_word = words.sample
    guessed_letters = []
    wrong_guesses = 0
    max_wrong = 6
    
    give_starting_hints(secret_word, guessed_letters)
    
    puts "Guess the word! It has #{secret_word.length} letters."
    puts "💡 Some letters are revealed to help you get started!"
    
    loop do
      display_word(secret_word, guessed_letters)
      puts "Wrong guesses: #{wrong_guesses}/#{max_wrong}"
      puts "Guessed letters: #{guessed_letters.join(', ')}" unless guessed_letters.empty?
      
      print "\nGuess a letter: "
      guess = gets.chomp.downcase
      
      if guess.length != 1 || !guess.match?(/[a-z]/)
        puts "Please enter a single letter!"
        next
      end
      
      if guessed_letters.include?(guess)
        puts "You already guessed that letter!"
        next
      end
      
      guessed_letters << guess
      
      if secret_word.include?(guess)
        puts "✅ Good guess!"
        
        if word_complete?(secret_word, guessed_letters)
          puts "\n🎉 Congratulations! You guessed the word: #{secret_word.upcase}"
          break
        end
      else
        puts "❌ Wrong letter!"
        wrong_guesses += 1
        
        if wrong_guesses >= max_wrong
          puts "\n💀 Game over! The word was: #{secret_word.upcase}"
          break
        end
      end
    end
  end
  
  private
  
  def give_starting_hints(word, guessed_letters)
    unique_letters = word.chars.uniq
    num_hints = [2, unique_letters.length / 3].min
    num_hints = 1 if num_hints == 0
    
    hint_letters = unique_letters.sample(num_hints)
    guessed_letters.concat(hint_letters)
    
    puts "🎁 Starting hints - these letters are in the word: #{hint_letters.join(', ').upcase}"
  end
  
  def display_word(word, guessed_letters)
    display = word.chars.map { |letter| guessed_letters.include?(letter) ? letter : '_' }.join(' ')
    puts "\nWord: #{display}"
  end
  
  def word_complete?(word, guessed_letters)
    word.chars.all? { |letter| guessed_letters.include?(letter) }
  end
end