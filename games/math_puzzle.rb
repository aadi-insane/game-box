class MathPuzzleGame
  def play
    puts "Welcome to Math Puzzle Game!"
    puts "Solve as many math problems as you can!"
    
    score = 0
    problems_solved = 0
    
    loop do
      num1 = rand(1..20)
      num2 = rand(1..20)
      operation = ['+', '-', '*'].sample
      
      case operation
      when '+'
        correct_answer = num1 + num2
      when '-'
        correct_answer = num1 - num2
      when '*'
        correct_answer = num1 * num2
      end
      
      puts "\nProblem #{problems_solved + 1}:"
      print "What is #{num1} #{operation} #{num2}? (or 'quit' to exit): "
      answer = gets.chomp
      
      break if answer.downcase == 'quit'
      
      problems_solved += 1
      
      if answer.to_i == correct_answer
        puts "✅ Correct!"
        score += 1
      else
        puts "❌ Wrong! The answer is #{correct_answer}"
      end
      
      accuracy = (score.to_f / problems_solved * 100).round(1)
      puts "Score: #{score}/#{problems_solved} (#{accuracy}% accuracy)"
    end
    
    puts "\n" + "="*30
    puts "Math session complete!"
    puts "Final score: #{score} correct out of #{problems_solved} problems!"
    
    if problems_solved > 0
      final_accuracy = (score.to_f / problems_solved * 100).round(1)
      puts "Final accuracy: #{final_accuracy}%"
      
      case final_accuracy
      when 90..100
        puts "🏆 Math genius!"
      when 70..89
        puts "🎉 Great job!"
      when 50..69
        puts "👍 Not bad!"
      else
        puts "📚 Keep practicing!"
      end
    end
  end
end