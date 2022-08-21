# frozen_string_literal: true

require_relative '../lib/library'

describe HalfMove do
  subject(:half_move) { described_class.new(game)}

  describe '#play' do
    let(:game) { Game.new(board:, color:)}

    context 'when the current player is checkmated' do
      let(:board) { Board.for('2k4R/5R2/8/8/8/2K5/7p/8') }
      let(:color) { Color::BLACK }

      it "returns 'checkmated'" do
        result = half_move.play
        expected = 'checkmated'

        expect(result).to eq expected
      end
    end
  end
end