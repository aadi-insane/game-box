class TextAdventure
  def play
    puts "Welcome to Mini Text Adventure!"
    puts "You find yourself at the entrance of a mysterious cave..."
    
    @player_health = 100
    @has_torch = false
    @has_treasure = false
    
    entrance_choice
  end
  
  private
  
  def entrance_choice
    puts "\n🏔️ You're standing at a dark cave entrance."
    puts "What do you want to do?"
    puts "1. Enter the cave"
    puts "2. Look around outside"
    puts "3. Leave and go home"
    
    choice = get_choice(3)
    
    case choice
    when 1
      enter_cave
    when 2
      look_around
    when 3
      puts "You decide it's too dangerous and head home safely. 🏠"
      puts "THE END"
    end
  end
  
  def look_around
    puts "\n🔍 You search around the cave entrance."
    puts "You find an old torch! This might be useful."
    @has_torch = true
    puts "✅ Torch added to inventory!"
    entrance_choice
  end
  
  def enter_cave
    if @has_torch
      puts "\n🔦 Your torch lights up the cave. You can see clearly!"
      cave_with_light
    else
      puts "\n🌑 It's pitch black inside. You stumble around blindly."
      puts "You hear strange noises and quickly retreat!"
      puts "Maybe you should look for a light source first..."
      entrance_choice
    end
  end
  
  def cave_with_light
    puts "\n💎 Deep in the cave, you see two paths:"
    puts "1. Go left toward a glittering chamber"
    puts "2. Go right toward the sound of water"
    puts "3. Go back to the entrance"
    
    choice = get_choice(3)
    
    case choice
    when 1
      treasure_chamber
    when 2
      underground_river
    when 3
      entrance_choice
    end
  end
  
  def treasure_chamber
    puts "\n💰 You enter a chamber filled with gold and jewels!"
    puts "But suddenly, a sleeping dragon wakes up! 🐉"
    puts "What do you do?"
    puts "1. Try to grab some treasure quickly"
    puts "2. Slowly back away"
    puts "3. Try to befriend the dragon"
    
    choice = get_choice(3)
    
    case choice
    when 1
      puts "You grab a handful of gold, but the dragon breathes fire!"
      @player_health -= 50
      puts "💔 You lose 50 health! Current health: #{@player_health}"
      if @player_health > 0
        puts "You escape with some treasure! 💰"
        @has_treasure = true
        victory_ending
      else
        death_ending
      end
    when 2
      puts "You carefully back away. The dragon goes back to sleep."
      cave_with_light
    when 3
      puts "You speak softly to the dragon. Surprisingly, it's friendly!"
      puts "The dragon gives you a magical gem as a gift! 💎"
      @has_treasure = true
      victory_ending
    end
  end
  
  def underground_river
    puts "\n🌊 You find a beautiful underground river."
    puts "The water looks crystal clear and refreshing."
    puts "What do you do?"
    puts "1. Drink the water"
    puts "2. Follow the river deeper"
    puts "3. Go back"
    
    choice = get_choice(3)
    
    case choice
    when 1
      puts "The magical water restores your health completely! ✨"
      @player_health = 100
      puts "💚 Health restored to 100!"
      underground_river
    when 2
      puts "Following the river, you discover a hidden exit!"
      puts "You emerge into a beautiful valley filled with flowers. 🌸"
      peaceful_ending
    when 3
      cave_with_light
    end
  end
  
  def victory_ending
    puts "\n🎉 VICTORY!"
    puts "You successfully completed your adventure!"
    puts "Health: #{@player_health}/100"
    puts "Treasure obtained: #{@has_treasure ? 'Yes' : 'No'}"
    puts "You return home as a hero! 👑"
    puts "THE END"
  end
  
  def peaceful_ending
    puts "\n🌅 PEACEFUL ENDING"
    puts "You found a secret way out and discovered a beautiful valley."
    puts "Sometimes the best adventures lead to unexpected peaceful places."
    puts "THE END"
  end
  
  def death_ending
    puts "\n💀 GAME OVER"
    puts "Your adventure ends here..."
    puts "But every hero's journey has setbacks. Try again!"
    puts "THE END"
  end
  
  def get_choice(max_options)
    loop do
      print "Enter your choice (1-#{max_options}): "
      choice = gets.chomp.to_i
      return choice if choice.between?(1, max_options)
      puts "Invalid choice! Please enter a number between 1 and #{max_options}."
    end
  end
end