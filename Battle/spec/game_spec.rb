# spec/game_spec.rb
require 'game'

describe Game do
  subject(:game) { described_class.new(player_1, player_2) }
  let(:player_1) { double :player }
  let(:player_2) { double :player }

  describe '#players' do
    it 'retrieves the first player' do
      expect(game.player_1).to eq player_1
    end

    it 'retrieves the second player' do
      expect(game.player_2).to eq player_2
    end
  end

  # refactored to another class, this test obsolete
  # describe '#attack' do
  #   it 'damages opponent' do
  #     expect(player_2).to receive(:receive_damage)
  #     game.attack(player_2)
  #   end
  # end

  describe '#switch_turn' do
    it 'switches turn from Player 1 to Player 2' do
      game.switch_turn
      expect(game.whose_turn).to eq player_2
    end

    it 'switches back from Player 2 to Player 1' do
      game.switch_turn
      game.switch_turn
      expect(game.whose_turn).to eq player_1
    end
  end
end