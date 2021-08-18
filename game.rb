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
    if gets.chomp.to_i == @new_question.answer
      if @player1.turn
        puts "You are right! Good job!"
        @player1.turn = false
        @player2.turn = true
        puts "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"
        check_winner
      else
        puts "You are right! Good job!"
        @player1.turn = true
        @player2.turn = false
        puts "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"
        check_winner
      end
    else
      if @player1.turn
        @player1.lives -= 1
        puts "You are not right. BOOM you lose a point"
        @player1.turn = false
        @player2.turn = true
        puts "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name} : #{@player2.lives}/3"
        check_winner
      else
        @player2.lives -= 1
        puts "You are not right. BOOM you lose a point"
        @player1.turn = true
        @player2.turn = false
        puts "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"
        check_winner
      end
    end
  end
  
  def check_winner
    if @player1.lives == 0
      puts "----- GAME OVER -----"
      puts "#{@player2.name} wins with a score of #{@player2.lives}/3"
      puts "Please play again"
    elsif @player2.lives == 0
      puts "----- GAME OVER -----"
      puts "#{@player1.name} wins with a score of #{@player1.lives}/3"
      puts "Please play again"
    else
      next_turn
    end
  end
  
  def next_turn
  end

end
  
  