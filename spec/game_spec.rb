# frozen_string_literal: true

require_relative '../lib/library'

describe Game do
  describe '#player_can_castle_kingside?' do
    subject(:game) { described_class.new(board: Board.for) }

    context 'if white can castle kinngside' do
      it 'returns true' do
        result = game.player_can_castle_kingside?(Color::WHITE)

        expect(result).to be true
      end
    end
  end
end
