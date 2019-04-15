module TicTacToe
# This class is for initilizing the player object
  class Player
    attr_reader :name, :color
    def initialize(input)
      @name = input[:name]
      @color = input[:color]
    end
  end
end
