require_relative '../lib/main'

describe Game do
  describe '#legal_move?' do
    context 'when rook move' do
      it 'can move to a square in same vertical line if not blocked by any pieces' do
        subject(:game) { Game.new({board: Board.new('rnbqkbnr/1ppppppp/1p6/8/8/8/1PPPPPPP/RNBQKBNR')})}

        result = game.legal_move?(Cell.for('A1'), Cell.for('A5'))

        expect(result).to be true
      end

      xit 'can move to a square in same vertical line if not blocked by any pieces' do
        subject(:game) { Game.new({board: Board.new('rnbqkbnr/1ppppppp/1p6/8/R7/8/1PPPPPPP/1NBQKBNR')})}

        result = game.legal_move?(Cell.for('A4'), Cell.for('E4'))

        expect(result).to be true

      end
    end
  end
end