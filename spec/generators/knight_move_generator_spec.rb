require_relative '../../lib/library'
require_relative '../generator_interface_spec'

describe KnightMoveGenerator do
  subject(:generator) { described_class.new }

  include_examples 'implement the generator interface'

  describe '#cells' do
    it 'generates all valid neighbours cells from origin' do
      expected = [
        Cell.for('C2'),
        Cell.for('B3'),
        Cell.for('B5'),
        Cell.for('C6'),
        Cell.for('E6'),
        Cell.for('F5'),
        Cell.for('F3'),
        Cell.for('E2')
      ]
      result = generator.cells(Cell.for('D4'))
      expect(result).to match_array expected
    end

    it 'generates all valid neighbours cells from origin expect those out-of-range' do
      expected = [
        Cell.for('D1'),
        Cell.for('D3'),
        Cell.for('C4'),
        Cell.for('A4')
      ]
      result = generator.cells(Cell.for('B2'))
      expect(result).to match_array expected
    end
  end
end
