module TicTacToe
  # This class is for initilizing the Board object
  class Board
    attr_reader :grid

    def initialize(input = {})
      @grid = input.fetch(:grid, default_grid)
    end

    #    def initialize()
    #     @grid = Array.new(3) { Array.new { Cell.new } }
    #  end

    def get_value_at(x, y)
      grid[x][y]
    end

    def set_value_at(x, y, value)
      grid[x][y].value = value
    end

    def game_over
      return :winner if winner?
      return :draw if draw?

      false
    end

    def display_grid
      grid.each do |row|
        puts row.map { |cell| cell.value.empty? ? '_' : cell.value }.join(' ')
      end
    end

    private

    def default_grid
      Array.new(3) { Array.new(3) { Cell.new } }
    end

    def draw?
      return false if grid.flatten.map(&:value).none_empty?
    end

    def winner?
      winning_positions.each do |winning_position|
        next if winning_position.map(&:value).all_empty?

        return true if winning_position.map(&:value).all_equal?
      end

      false
    end

    def winning_positions
      grid + grid.transpose + [[grid[0][0], grid[1][1], grid[2][2]] + [grid[2][0], grid[1][1], grid[0][2]]]
    end
  end
end
