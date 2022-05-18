require_relative '../lib/main'

describe Game do
  describe '#legal_move?' do
    context 'when rook move' do
      xit 'can move to a square in same vertical line if not blocked by any pieces' do
        subject(:game) { Game.new(board: Board.new(board: BoardBuilder.new.whole('rnbqkbnr/1ppppppp/1p6/8/8/8/1PPPPPPP/RNBQKBNR')))}

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

  describe '#get_positions_from_input' do
    subject(:game) { Game.new(board: Board.new(BoardBuilder.new.whole('rnbqkbnr/1ppppppp/1p6/8/8/8/1PPPPPPP/RNBQKBNR')))}
    
   
    context 'when give input A1A8' do
      it 'retuns Cell A1 and Cell A8' do
        result = game.get_positions_from_input('A1A8')
        expected = [Cell.for('A1'), Cell.for('A8')]

        expect(result).to eq expected
      end
    end

    context 'when give input H1H8' do
      it 'retuns Cell H1 and Cell H8' do
        result = game.get_positions_from_input('H1H8')
        expected = [Cell.for('H1'), Cell.for('H8')]

        expect(result).to eq expected
      end
    end

    context 'when give out-of-range input' do
      it 'retuns nil' do
        result = game.get_positions_from_input('E1D9')
        expected = nil

        expect(result).to be nil
      end
    end
  end
      
        
end