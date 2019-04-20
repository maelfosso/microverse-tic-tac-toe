require 'spec_helper'

module TicTacToe
  describe Board do

    context "#initialize" do
      it "#initialize the board with a grid" do
        expect {Board.new(grid: "grid")}.to_not raise_error
      end

      it "sets the grid with tree rows by default" do
        board = Board.new
        expect(board.grid.size).to eq(3)
      end

      it "creates three things in each row by default" do
        board = Board.new
        board.grid.each do |row|
          expect(row.size).to eq(3)
        end
      end
    end

    context "#grid" do
      it "returns the grid" do
        board = Board.new(grid: "tic tac toe")
        expect(board.grid).to eq("tic tac toe")
      end
    end

    context "#get_value_at" do
      it "returns the value at position x,y given" do
        board = Board.new(grid: [["","X",""],["O","X",""],["","O","O"]])
        expect(board.get_value_at(0,0)).to eq("")
      end
    end

    context "#set_value_at" do
      it "sets the value at position x,y" do
        S = Struct.new(:value)
        board = Board.new(grid: [["","X",""],["O","",S.new("X")],["","O","O"]])
        board.set_value_at(1, 2, "X")
        expect(board.get_value_at(1,2).value).to eq "X"
      end
    end


    SampleCell = Struct.new(:value)
    let(:x_cell) { SampleCell.new("X") }
    let(:o_cell) { SampleCell.new("O") }
    let(:empty) { SampleCell.new }

    context "#game_over" do
      it "returns :winner if winner? is true" do
        board = Board.new
        allow(board).to receive(:winner?).and_return(true)
        expect(board.game_over).to eq(:winner)
      end

      it "returns :draw if winner? is false and draw? is true" do
        board = Board.new
        allow(board).to receive(:winner?) {false}
        allow(board).to receive(:draw?) {true}
        expect(board.game_over).to eq(:draw)
      end

      it "returns false if winner? is false and draw? is false" do
        board = Board.new
        allow(board).to receive(:winner?).and_return(false)
        allow(board).to receive(:draw?).and_return(false)
        expect(board.game_over).to eq(false)
      end

      it "returns :winner when there is a row with the same object" do
        grid = [
          [x_cell, x_cell, x_cell],
          [o_cell, o_cell, x_cell],
          [empty, x_cell, o_cell]
        ]
        board = Board.new(grid: grid)
        expect(board.game_over).to eq(:winner)
      end

      it "returns :winner when there is a column with the same object" do
        grid = [
          [x_cell, o_cell, o_cell],
          [x_cell, o_cell, x_cell],
          [empty, o_cell, x_cell]
        ]
        board = Board.new(grid: grid)
        expect(board.game_over).to eq(:winner)
      end

      it "returns :winner when there is a diagonal with all the same object" do
        grid = [
          [o_cell, x_cell, o_cell],
          [o_cell, o_cell, x_cell],
          [empty, x_cell, o_cell]
        ]
        board = Board.new(grid: grid)
        expect(board.game_over).to eq(:winner)
      end

      it "returns false when the game is not finished" do
        grid = [
          [x_cell, empty, empty],
          [o_cell, empty, x_cell],
          [empty, empty, empty]
        ]
        board = Board.new(grid: grid)
        expect(board.game_over).to eq(false)
      end

      it "returns :draw when there are not empty place on the board" do
        grid = [
          [x_cell, o_cell, x_cell],
          [o_cell, o_cell, x_cell],
          [o_cell, x_cell, o_cell]
        ]
        board = Board.new(grid: grid)
        expect(board.game_over).to eq(:draw)
      end
    end
  end
end
