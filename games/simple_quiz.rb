class SimpleQuiz
  def play
    puts "Welcome to Simple Quiz!"
    puts "Answer these 5 questions:"
    
    questions = [
      { question: "What is the capital of France?", answer: "paris" },
      { question: "What is 7 x 8?", answer: "56" },
      { question: "What planet is known as the Red Planet?", answer: "mars" },
      { question: "How many continents are there?", answer: "7" },
      { question: "What is the largest ocean on Earth?", answer: "pacific" }
    ]
    
    score = 0
    
    questions.each_with_index do |q, index|
      puts "\nQuestion #{index + 1}: #{q[:question]}"
      print "Your answer: "
      answer = gets.chomp.downcase.strip
      
      if answer == q[:answer]
        puts "✅ Correct!"
        score += 1
      else
        puts "❌ Wrong! The correct answer is: #{q[:answer].capitalize}"
      end
    end
    
    puts "\n" + "="*30
    puts "Quiz Complete!"
    puts "Your score: #{score}/#{questions.length}"
    
    case score
    when 5
      puts "🏆 Perfect! You're a genius!"
    when 4
      puts "🎉 Excellent! Almost perfect!"
    when 3
      puts "👍 Good job! Not bad!"
    when 2
      puts "😐 Okay, room for improvement."
    when 1
      puts "😬 You got one right at least!"
    else
      puts "💀 Better luck next time!"
    end
  end
end