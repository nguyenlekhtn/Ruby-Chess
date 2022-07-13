require_relative '../lib/library'

describe Navigator do
  describe '#neighbors_of_a_piece' do
    subject(:navigator) { Navigator.new(board:) }

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
          Cell.for('B4'),
        ]
        result = navigator.neighbors_of_a_piece(Cell.for('C5'))
        expect(result).to match_array expected
      end
    end
  end
end