require_relative '../../lib/library'

describe VerticalLineGenerator do
  subject(:generator) { described_class.new }

  describe '#cells' do
    it 'should return all cells same diagonal lines with given cell' do
      result = generator.cells(Cell.new(2, 3))
      expected = [
        [0, 3], [1, 3], [3, 3], [4, 3], [5, 3], [6, 3], [7, 3]
      ].map { |(row, col)| Cell.new(row, col)}
      expect(result).to match_array expected
    end
  end
end