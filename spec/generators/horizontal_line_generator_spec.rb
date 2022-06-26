require_relative '../../lib/library'

describe HorizontalLineGenerator do
  subject(:generator) { described_class.new }

  describe '#cells' do
    it 'should return all cells same diagonal lines with given cell' do
      result = generator.cells(Cell.new(2, 3))
      expected = [
        [2, 0], [2, 1], [2, 2], [2, 4], [2, 5], [2, 6], [2, 7]
      ].map { |(row, col)| Cell.new(row, col)}
      expect(result).to match_array expected
    end
  end
end