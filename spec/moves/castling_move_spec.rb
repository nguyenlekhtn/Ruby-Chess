# frozen_string_literal: true

require_relative '../../lib/library'

describe CastlingMove do
  describe 'board_after_move' do
    subject(:move) { described_class.new(KingsideCastlingGenerator.new(game, WhiteSide.new)) }

    let(:game) { Game.new(board:) }

    context 'when white kingside castling happened' do
      let(:board) { Board.for('4k3/8/8/8/8/8/8/4K2R') }

      it 'moves king and rook to correct positon' do
        result = move.board_after_move(board)
        expected = Board.for('4k3/8/8/8/8/8/8/5RK1')
        expect(result).to eq expected
      end
    end
  end
end
