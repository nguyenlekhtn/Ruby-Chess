# frozen_string_literal: true

require_relative '../../lib/library'
require_relative '../generator_interface_spec'

describe VerticalLineGenerator do
  subject(:generator) { described_class.new(game) }
  let(:game) { Game.new(board:) }

  context 'when the subject acts as a generator' do
    let(:board) { Board.for }
    include_examples 'implement the generator interface'
  end

  describe '#cells' do
    let(:board) { Board.for('8/3R4/8/8/8/3Q4/8/8') }

    it 'should return all cells same vertical lines with given cell' do
      result = generator.cells(Cell.new(2, 3))
      expected = [
        [0, 3], [1, 3], [3, 3], [4, 3], [5, 3], [6, 3]
      ].map { |(row, col)| Cell.new(row, col) }
      expect(result).to match_array expected
    end
  end
end
