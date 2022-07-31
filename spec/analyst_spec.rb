require_relative '../lib/library'

describe Analyst do
  subject(:analyst) { described_class.new(game) }

  describe '#ing_in_check_after_move?' do
    let(:game) { Game.new(board:) }

    context 'when white rook is blocking black rook from checking white king' do
      let(:board) { Board.for('k5qr/8/2n4R/p1P5/P7/8/8/7K') }

      it 'king is in-check if rook moves horizontal' do
        result = analyst.king_in_check_after_move?(Cell.for('H6'), { cell: Cell.for('G6'), generator: HorizontalLineGenerator.new(game) })

        expect(result).to be true
      end

      it 'king is not in-check if rook moves vertical' do
        result = analyst.king_in_check_after_move?(Cell.for('H6'), { cell: Cell.for('H7'), generator: VerticalLineGenerator.new(game) })

        expect(result).to be false
      end
    end
  end

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
        result = analyst.neighbors_of_a_piece(Cell.for('C5'))
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
        result = analyst.neighbors_of_a_piece(Cell.for('H6'))
        expect(result).to match_array expected
      end
    end
  end

  describe '#theoretical_moves_of_a_player' do
    let(:game) { Game.new(board:) }

    context 'given a simple board with white only has only king and bishop' do
      let(:board) { Board.for('K7/8/8/8/3p4/8/5B2/7k') }

      it 'should return all theoretical moves by white player' do
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

        result = analyst.theoretical_moves_of_a_player(Color::WHITE)
        expect(result).to match_array expected
      end
    end
  end
end
