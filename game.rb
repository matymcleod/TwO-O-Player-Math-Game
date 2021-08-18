require './players.rb'
require './questions.rb'

class Game
  def initialize
    puts "What is player 1's name?"
    player1 = gets.chomp
    @player1 = Player.new(player1)
    puts "What is player 2's name?"
    player2 = gets.chomp
    @player2 = Player.new(player2)
  end

  def start_question
    @new_question = Question.new
    puts "----- NEW TURN -----"
    if @player1.turn
      puts "#{@player2.name}: #{@new_question.new_question}"
    else
      puts "#{@player1.name}: #{@new_question.new_question}"
    end
  end

  def check_answer
  end
  
  def check_winner
  end
  
  def next_turn
  end

end
  
  