require 'spec_helper'

module TicTacToe
  describe Game do
    let (:terver) { Player.new({name: "Terver", color:"X"}) }
    let (:mael) { Player.new({name: "Mael", color:"O"}) }
    let (:game) { Game.new([terver, mael]) }

    context "#initialize" do
      it "return a good list of available move" do
        game = Game.new([terver, mael])
        expect(game.move_available).to eq([*1..9])
      end

      it "randomly selects a current_player" do
        allow_any_instance_of(Array).to receive(:shuffle) { [mael, terver] }
        game = Game.new([terver, mael])
        expect(game.current_player).to eq(mael)
      end

      it "randomly selects an other player" do
        allow_any_instance_of(Array).to receive(:shuffle) { [mael, terver] }
        game = Game.new([terver, mael])
        expect(game.other_player).to eq(terver)
      end
    end

    context "#switch_players" do
      it "will set @current_player to @other_player" do
        game = Game.new([terver, mael])
        current_player = game.current_player
        game.switch_players
        expect(game.other_player).to eq(current_player)
      end

      it "will set @other_player to @current_player" do
        game = Game.new([terver, mael])
        other_player = game.other_player
        game.switch_players
        expect(game.current_player).to eq(other_player)
      end
    end

    context "#please_move" do
      it "will generate the good message" do
        game = Game.new([terver, mael])
        allow(game).to receive(:current_player) { terver }
        expected = "Terver : Enter a number between those numbers [1, 2, 3, 4, 5, 6, 7, 8, 9] indicating where you want to play"
        expect(game.please_move).to eq(expected)
      end
    end

    context "#get_move_played" do
      it "convert 1 to [0,0]" do
        game = Game.new([terver, mael])
        expect(game.get_move_played("1")).to eq([0,0])
      end

      it "convert 5 to [1, 1]" do
        game = Game.new([terver, mael])
        expect(game.get_move_played("5")).to eq([1, 1])
      end
    end

    context "#game_over_message" do
      it "returns '{current player name} won!' if board shows a winner" do
        game = Game.new([terver, mael])
        allow(game).to receive(:current_player) { terver }
        allow(game.board).to receive(:game_over) { :winner }
        expect(game.game_over_message).to eq "Terver won!"
      end

      it "returns 'The game ended in a tie' if board shows a draw" do
        game = Game.new([terver, mael])
        allow(game).to receive(:current_player) { terver }
        allow(game.board).to receive(:game_over) { :draw }
        expect(game.game_over_message).to eq "Draw Game !!!"
      end
    end
  end
end
