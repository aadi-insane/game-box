#!/usr/bin/env ruby

require_relative 'games/number_guessing'
require_relative 'games/rock_paper_scissors'
require_relative 'games/dice_rolling'
require_relative 'games/coin_toss'
require_relative 'games/even_odd_checker'
require_relative 'games/simple_quiz'
require_relative 'games/math_puzzle'
require_relative 'games/word_guess'
require_relative 'games/compliment_generator'
require_relative 'games/text_adventure'

class GameLauncher
  def initialize
    @games = {
      1 => { name: "Number Guessing Game", class: NumberGuessingGame },
      2 => { name: "Rock, Paper, Scissors", class: RockPaperScissorsGame },
      3 => { name: "Dice Rolling Game", class: DiceRollingGame },
      4 => { name: "Coin Toss Game", class: CoinTossGame },
      5 => { name: "Even or Odd Checker", class: EvenOddChecker },
      6 => { name: "Simple Quiz", class: SimpleQuiz },
      7 => { name: "Math Puzzle Game", class: MathPuzzleGame },
      8 => { name: "Word Guess Game", class: WordGuessGame },
      9 => { name: "Random Compliment Generator", class: ComplimentGenerator },
      10 => { name: "Mini Text Adventure", class: TextAdventure }
    }
  end

  def run
    loop do
      display_menu
      choice = gets.chomp.to_i
      
      if choice == 0
        puts "Thanks for playing! Goodbye!"
        break
      elsif @games[choice]
        puts "\n" + "="*50
        puts "Starting #{@games[choice][:name]}..."
        puts "="*50
        @games[choice][:class].new.play
        puts "\nPress Enter to return to main menu..."
        gets
      else
        puts "Invalid choice! Please try again."
      end
    end
  end

  private

  def display_menu
    system('clear') || system('cls')
    puts "🎮 RUBY GAMES COLLECTION 🎮"
    puts "="*40
    @games.each do |num, game|
      puts "#{num}. #{game[:name]}"
    end
    puts "0. Exit"
    puts "="*40
    print "Choose a game (0-10): "
  end
end

if __FILE__ == $0
  GameLauncher.new.run
end