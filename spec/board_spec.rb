require_relative '../lib/cell'
require_relative '../lib/board'

describe Board do
  describe '#get_name_at' do
    subject(:board) { described_class.new }

    context 'when the cell has a piece there' do
      it 'returns the piece' do
        cell = Cell.for('A1')
        result = board.get_name_at(cell)

        expect(result).to eq(Rook.new('white'))
      end
    end

    context 'when the cell has no piece there' do
      it 'returns blank piece' do
        cell = Cell.for('D3')
        result = board.get(cell)

        expect(result).to eq(Piece.new)
      end
    end
  end

  describe '#set' do
    subject(:board) { described_class.new }

    context 'when set the piece White Rook at a3' do
      it 'has the white rook at A3' do
        cell = Cell.for('A3')
        white_rook = Rook.new('white')
        board.set(cell, white_rook)

        expect(board.get(cell)).to eq(white_rook)
      end
    end
  end

  describe "#delete" do
    subject(:board) { described_class.new }

    context 'when delte the cell a3' do
      it 'has blank piece at there' do
        cell = Cell.for('A3')
        board.delete(cell)

        expect(board.delete(cell)).to eq(Piece.new)
      end
    end
  end
end
