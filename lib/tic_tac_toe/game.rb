module TicTacToe

  class Game
    attr_reader :players, :board, :current_player, :other_player

    def initialize(players, board = Board.new)
      @players = players
      @board = board
      @current_player, @other_player = players.shuffle
    end

    def switch_players
      @current_player, @other_player = @other_player, @current_player
    end

    def please_move
      return "#{current_player.name} : Enter a number between 1 to 9 indicating where you want to play"
    end

    def get_move_played(move = gets.chomp)
      mapping = {
        "1" => [0,0],
        "2" => [0,1],
        "3" => [0,2],
        "4" => [1,0],
        "5" => [1,1],
        "6" => [1,2],
        "7" => [2,0],
        "8" => [2,1],
        "9" => [2,2]
      }

      mapping[move]
    end

    def game_over_message
      return "#{current_player.name} won!" if board.game_over == :winner
      return "Draw Game !!!" if board.game_over == :draw
    end

    def self.welcome
      puts "Welcome to the Tic Tac Toe Game"
      puts "Indicate the cell where you play by using this reference"
      [[1,2,3],[4,5,6],[7,8,9]].each do |row|
        puts row.map { |n| n }.join(' ')
      end
    end

    def play
      puts "#{current_player.name} is the first one to start !"

      while true
        board.display_grid
        puts ""
        puts please_move
        x, y = get_move_played
        board.set_value_at(x, y, current_player.color)

        if (board.game_over)
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