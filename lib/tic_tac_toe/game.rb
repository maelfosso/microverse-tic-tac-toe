module TicTacToe
# This class is for initilizing the game object
  class Game
    attr_reader :players, :board, :current_player, :other_player, :move_available

    def initialize(players, board = Board.new)
      @players = players
      @board = board
      @current_player, @other_player = players.shuffle
      @move_available = [*1..9]
    end

    def switch_players
      @current_player, @other_player = @other_player, @current_player
    end

    def please_move
      "#{current_player.name} : Enter a number between those numbers [#{move_available.join(", ")}] indicating where you want to play"
    end

    def get_move_played(move)
      mapping = {
        '1' => [0, 0],
        '2' => [0, 1],
        '3' => [0, 2],
        '4' => [1, 0],
        '5' => [1, 1],
        '6' => [1, 2],
        '7' => [2, 0],
        '8' => [2, 1],
        '9' => [2, 2]
      }

      mapping[move]
    end

    def game_over_message
      return "#{current_player.name} won!" if board.game_over == :winner
      return 'Draw Game !!!' if board.game_over == :draw
    end

    def play
      puts "#{current_player.name} is the first one to start !"

      loop do
        board.display_grid
        puts ''
        puts please_move

        move = gets.chomp
        while(!move_available.include?(move.to_i)) do
          puts please_move
          move = gets.chomp
        end
        move_available.delete_at(move_available.index(move.to_i))

        puts "We get the move played"
        x, y = get_move_played(move)
        board.set_value_at(x, y, current_player.color)

        if board.game_over
          puts game_over_message
          board.display_grid
          return
        else
          switch_players
        end
      end
    end
  end
end
