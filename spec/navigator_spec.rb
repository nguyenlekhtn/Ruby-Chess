require_relative '../lib/library'

describe Navigator do \
  subject(:navigator) { Navigator.new(game) }

  describe '#neighbors_of_a_piece' do
    let(:game) { Game.new(board:) }

    context 'given C51 Evans Gambit board' do
      let(:board) { Board.for('r1bqk1nr/pppp1ppp/2n5/2b1p3/1PB1P3/5N2/P1PP1PPP/RNBQK2R') }

      it 'should return all neighbors from C5' do
        expected = [
          Cell.for('F2'),
          Cell.for('E3'),
          Cell.for('D4'),
          Cell.for('F8'),
          Cell.for('E7'),
          Cell.for('D6'),
          Cell.for('B6'),
          Cell.for('B4')
        ]
        result = navigator.neighbors_of_a_piece(Cell.for('C5'))
        expect(result).to match_array expected
      end
    end

    context 'when white rook is blocking black rook from checking white king' do
      let(:board) { Board.for('k5qr/8/2n4R/p1P5/P7/8/8/7K') }

      it 'white rook can only move vertically' do
        expected = [
          Cell.for('H2'),
          Cell.for('H3'),
          Cell.for('H4'),
          Cell.for('H5'),
          Cell.for('H7'),
          Cell.for('H8')
        ]
        result = navigator.neighbors_of_a_piece(Cell.for('H6'))
        expect(result).to match_array expected
      end
    end
  end

  describe '#legal_moves_of_a_player' do
    let(:game) { Game.new(board:) }

    context 'given a simple board with white only has only king and bishop' do
      let(:board) { Board.for('K7/8/8/8/3p4/8/5B2/7k') }

      it 'should return all legal moves by white player' do
        expected = [
          Cell.for('D4'),
          Cell.for('E3'),
          Cell.for('E1'),
          Cell.for('G3'),
          Cell.for('G1'),
          Cell.for('H4'),
          Cell.for('A7'),
          Cell.for('B8'),
          Cell.for('B7')
        ]

        result = navigator.legal_moves_of_a_player(Color::WHITE)
        expect(result).to match_array expected
      end
    end
  end
end
