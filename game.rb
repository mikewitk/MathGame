# module MathGame
#   class Game

#     def initialize
#       @ArrPlayers = []
#       @ArrPlayers << Player.new << Player.new
#       @endGame = false
#       @number_of_players = @ArrPlayers.length
#     end

#     def start
#       puts 'Starting game...'
#       current_player_counter = 0

#       while (!@endGame) do
#         current_player = @ArrPlayers[current_player_counter]
#         next_player_counter = (current_player_counter + 1) % @number_of_players
#         next_player = @ArrPlayers[next_player_counter]
#         Turn.new current_player
#         puts Player.score @ArrPlayers
#         if (current_player.life == 0)
#           @endGame = true
#           puts "#{next_player.name} wins with a score of #{next_player.life}/3"
#         end
#         current_player_counter = next_player_counter
#       end
#       puts '----- GAME OVER -----'
#     end

#   end
# end

require './player.rb'

class Game

  attr_accessor :player_1, :player_2, :turn, :num_1, :num_2, :result
  def initialize
    @player_1 = Player.new "player 1"
    @player_2 = Player.new "player 2"
    @turn = 0
    @num_1
    @num_2
    @result
  end

  def game
    while @player_1.hp > 0 && @player_2.hp > 0 do

      if @turn % 2 === 0
        player = @player_1
        @turn += 1
      else
        player = player_2
        @turn += 1
      end

      @num_1 = rand(1...20)
      @num_2 = rand(1...20)
      @result = @num_1 + @num_2
      puts "Quick Math #{player.name} -> #{num_1} + #{num_2} equals to?"
      ans = gets.chomp

      if result.to_i == ans.to_i
        puts "#{player.name} good job."
      else
        puts "#{player.name}, how can I put this?....WRONG!!"
        player.hp -= 1
      end

      if @player_1.hp === 0
        puts "#{player_2.name} WON! And you still have #{player_2.hp}/3 chances"
        puts " ______________ "
        puts "|              |"
        puts "| *GAME**OVER* |"
        puts "|______________|"
      elsif @player_2.hp === 0
        puts "#{player_1.name} WON! And you still have #{player_1.hp}/3 chances"
        puts " ______________ "
        puts "|              |"
        puts "| *GAME**OVER* |"
        puts "|______________|"
      else
        puts "#{player_1.name}: #{player_1.hp}/3 VS #{player_2.name}: #{player_2.hp}/3"
        puts "* * * * NEW TURN * * * *"
      end
    end
  end
end
