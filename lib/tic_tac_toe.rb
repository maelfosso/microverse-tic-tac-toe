module TicTacToe
    class Cell
        attr_accessor :value
        def initialize(value = "")
            @value = value
        end
    end

    class Player
        attr_reader :name, :color
        def initialize(value)
            @name = value.fetch(:name)
            @color = value.fetch(:color)
        end
    end
    
end