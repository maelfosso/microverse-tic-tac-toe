module TicTacToe
    class Player
        attr_reader :name, :color
        def initialize(value)
            @name = value.fetch(:name)
            @color = value.fetch(:color)
        end
    end
    
end