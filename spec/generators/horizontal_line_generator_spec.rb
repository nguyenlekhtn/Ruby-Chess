require_relative '../../lib/library'

describe HorizontalLineGenerator do
  subject(:generator) { described_class.new(board: board) }

  describe '#cells' do
    let(:board) { Board.for('8/8/8/8/8/N5N1/8/8') }

    it 'should return all cells same diagonal lines with given cell, that has no pieces in between' do
      result = generator.cells(Cell.new(2, 2))
      expected = [
        [2,0], [2, 1], [2, 3], [2, 4], [2, 5], [2, 6]
      ].map { |(row, col)| Cell.new(row, col)}
      expect(result).to match_array expected
    end
  end
end