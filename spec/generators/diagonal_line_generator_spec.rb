require_relative '../../lib/library'
require_relative '../generator_interface_spec'

describe DiagonalLineGenerator do
  subject(:generator) { described_class.new(game) }
  let(:game) { Game.new(board:) }

  describe '#cells' do
    context 'when the subject acts as a generator' do
      let(:board) { Board.for }
      include_examples 'implement the generator interface'
    end

    context 'if there is no piece interupting in its diagonal lines' do
      let(:board) { Board.for('8/8/8/8/8/3B4/8/8') }

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
        ].map { |(row, col)| Cell.new(row, col) }
        expect(result).to match_array expected
      end
    end

    context 'if there is a piece interupting in its diagonal lines' do
      let(:board) { Board.for('8/8/8/5p2/8/3B4/8/8') }

      it 'excludes that cell and all cells from it' do
        result = generator.cells(Cell.new(2, 3))
        expected = [
          [0, 1],
          [1, 2],
          [3, 4],
          [4, 5],
          [0, 5],
          [1, 4],
          [3, 2],
          [4, 1],
          [5, 0]
        ].map { |(row, col)| Cell.new(row, col) }
        expect(result).to match_array expected
      end
    end
  end
end
