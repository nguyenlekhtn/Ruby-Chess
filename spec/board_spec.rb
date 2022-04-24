require_relative '../lib/cell'
require_relative '../lib/board'

describe Board do
  describe '#get' do
    subject(:board) { described_class.new }

    context 'when the cell has a piece there' do
      it 'returns the piece' do
        cell = Cell.from_notation('A1')
        result = board.get(cell)

        expect(result).to eq(Rook.new('white'))
      end
    end
  end
end
