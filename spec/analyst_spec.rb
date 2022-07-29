require_relative '../lib/library'

describe Analyst do
  subject(:analyst) { described_class.new(game) }

  describe '#ing_in_check_after_move?' do
    let(:game) { Game.new(board:) }

    context 'when white rook is blocking black rook from checking white king' do
      let(:board) { Board.for('k5qr/8/2n4R/p1P5/P7/8/8/7K') }

      it 'king is in-check if rook moves horizontal' do
        result = analyst.king_in_check_after_move?(Cell.for('H6'), Cell.for('G6'))

        expect(result).to be true
      end

      it 'king is not in-check if rook moves vertical' do
        result = analyst.king_in_check_after_move?(Cell.for('H6'), Cell.for('H7'))

        expect(result).to be false
      end
    end
  end
end
