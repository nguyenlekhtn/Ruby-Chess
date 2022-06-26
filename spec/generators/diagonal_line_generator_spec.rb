require_relative '../../lib/library'

describe DiagonalLineGenerator do
  subject(:generator) { described_class.new }

  describe '#cells' do
    it 'should return all cells same diagonal lines with given cell' do
      result = generator.cells(Cell.new(2, 3))
      expected = [
        [0, 1],
        [1, 2],
        [3, 4],
        [4, 5],
        [5, 6],
        [6, 7],
        [0, 5],
        [1, 4],
        [3, 2],
        [4, 1],
        [5, 0]
      ].map { |(row, col)| Cell.new(row, col)}
      # 1, 2; 0, 1; 3, 4; 4, 5; 5, 6; 6, 7
      expect(result).to match_array expected
    end
  end
end