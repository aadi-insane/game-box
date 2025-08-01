class ComplimentGenerator
  def play
    puts "Welcome to Random Compliment Generator!"
    puts "Press Enter to get a compliment, or type 'quit' to exit."
    
    compliments = [
      "You're absolutely amazing! ⭐",
      "Your smile could light up the whole world! 😊",
      "You have incredible potential! 🚀",
      "You're one of a kind! 🦄",
      "Your creativity knows no bounds! 🎨",
      "You make the world a better place! 🌍",
      "You're stronger than you think! 💪",
      "Your kindness is contagious! ❤️",
      "You're a brilliant problem solver! 🧠",
      "You have an awesome sense of humor! 😄",
      "You're incredibly talented! 🎭",
      "Your determination is inspiring! 🔥",
      "You're a wonderful friend! 🤝",
      "You have a beautiful heart! 💖",
      "You're destined for greatness! 👑",
      "Your positive energy is infectious! ⚡",
      "You're absolutely fantastic! 🌟",
      "You have amazing style! 👗",
      "You're incredibly smart! 🎓",
      "You light up every room you enter! 💡"
    ]
    
    compliment_count = 0
    
    loop do
      print "\nPress Enter for a compliment: "
      input = gets.chomp.downcase
      break if input == 'quit'
      
      compliment = compliments.sample
      compliment_count += 1
      
      puts "\n" + "="*50
      puts "Compliment ##{compliment_count}:"
      puts compliment
      puts "="*50
      
      if compliment_count % 5 == 0
        puts "\n🎉 You've received #{compliment_count} compliments! You're awesome!"
      end
    end
    
    puts "\nYou received #{compliment_count} compliments today!"
    puts "Remember: You're amazing just the way you are! 💫"
  end
end