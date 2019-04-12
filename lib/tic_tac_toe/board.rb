module TicTacToe

  class Board
    attr_reader :grid

    def initialize()
      @grid = Array.new(3) { Array.new { Cell.new } }
    end

    def get_value_at(x, y)
      return grid[x][y]
    end

    def set_value_at(x, y, value)
      grid[x][y].value = value
    end

    def game_over
      return :winner if winner?
      return :draw if draw?
      false
    end

    private

    def draw?
      return false if grid.flatten.map { |cell| cell.value }.none_empty?
    end

    def winner?
      winning_positions.each |winning_position|
        next if winning_position.map { |cell| cell.value }.all_empty?
        return true if winning_position.map { |cell| cell.value }.all_equal?
      do

      return false
    end

    def winning_positions
      grid + grid.transpose + [[grid[0][0], grid[1][1], grid[2][2]] + [grid[2][0], grid[1][1] + grid[0][2]]]
    end

  end

end
