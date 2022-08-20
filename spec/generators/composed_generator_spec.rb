# frozen_string_literal: true

require_relative '../../lib/library'
require_relative '../generator_interface_spec'

describe ComposedGenerator do
  context 'when the subject acts as a generator' do
    subject(:generator) { described_class.new([]) }

    include_examples 'implement the generator interface'
  end

  describe '#cells' do
    subject(:generator) { described_class.new([generator1, generator2, generator3]) }

    let(:generator1) { double('generator1', cells: [Cell.new(0, 0), Cell.new(1, 2)]) }
    let(:generator2) { double('generator2', cells: [Cell.new(1, 0), Cell.new(1, 3)]) }
    let(:generator3) { double('generator3', cells: []) }

    it 'returns all cells generated by generators without duplication' do
      result = generator.cells(Cell.new(2, 3))
      expected = [
        [0, 0], [1, 0], [1, 2], [1, 3]
      ].map { |(row, col)| Cell.new(row, col) }
      expect(result).to match_array expected
    end
  end
end
