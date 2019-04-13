module TicTacToe
end

require_relative "./tic_tac_toe/core_extensions.rb"
require_relative "./tic_tac_toe/board.rb"
require_relative "./tic_tac_toe/cell.rb"
require_relative "./tic_tac_toe/game.rb"
require_relative "./tic_tac_toe/player.rb"

class Instruct
    puts "Welcome to tic tac toe"
    
    puts "Player one enter your name: "
    player_one = gets.chomp
    player_one = {color: "X", name: player_one}
    
    puts "Player two enter your name: "
    player_two = gets.chomp
    player_two = {color: "O", name: player_two}
    
    player_one = TicTacToe::Player.new(player_one)
    player_two = TicTacToe::Player.new(player_two)
    players = [player_one, player_two]
    
    TicTacToe::Game.new(players).play
end
