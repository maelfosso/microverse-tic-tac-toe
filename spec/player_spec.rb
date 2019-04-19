require 'spec_helper'

module TicTacToe
  describe Player do
    context "#initialize" do
      it "do not raises an exception when initialize with hash" do
        input = {"name": "TM", "color": "X"}
        expect { Player.new(input) }.to_not raise_error
      end
    end

    context "#color" do
      it "returns the color" do
        input = {"name": "TM", "color": "X"}
        player = Player.new(input)
        expect(player.color).to eq("X")
      end
    end

    context "#name" do
      it "returns the player's name" do
        input = {"name": "TM", "color": "X"}
        player = Player.new(input)
        expect(player.name).to eq("TM")
      end
    end
  end
end
