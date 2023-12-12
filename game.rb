require_relative './player'
require_relative './question'

class Game 

  def initialize
    @player1 = Player.new("Player1")
    @player2 = Player.new("Player2")
    @players = [@player1, @player2]
    @turn = 1
  end

  def game_over?
     @player1.life == 0 || @player2.life == 0 
  end

  def display_scoreboard
    puts
    puts "---------------------"
    puts"        Scoreboard "
    puts "#{@player1.name} Lives: #{@player1.life}/3"
    puts "#{@player2.name} Lives: #{@player2.life}/3"
    puts "---------------------"
    puts
  end
  
  def next_round
    sleep 0.5

    # next round
    @players.rotate! #change indexes of players in array
    @turn += 1

  end

  def play
       #game over? when a player will lose lives
 
    until game_over? do
      puts
      puts "--------NEW Turn##{@turn}--------"
      puts

      current_player = @players.first #who asks
      answer_player = @players.last #who answers
      
      q = Question.new
      puts "#{current_player.name}: #{q.generate_question}" #question in console

      answer = gets.chomp.to_i #answer from input convered to number
      
      if(q.result == answer) 
        puts "#{current_player.name}: YES! You are correct!"
      else
        puts "#{current_player.name}: Seriously? NO!"
        answer_player.died  #lose life if incorrect
      end


      # display the scoreboard
      display_scoreboard

      next_round

    end

    winner = @player1.winner? ? @player1 : @player2
    
    # display who is the winner
    puts "-----------------------"
    puts "The winner is #{winner.name}"
  end
end

two_o_player = Game.new


two_o_player.play #start game