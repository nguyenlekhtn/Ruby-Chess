require_relative '../lib/main'

describe Board do
  describe '#get_piece_at' do
    subject(:board) { described_class.new }

    context 'when the cell has a White Rock there' do
      it 'returns the White Rock' do
        result = board.get_piece_at(Cell.for('A1'))

        expect(result).to eq(Piece.for('R'))
      end
    end

    context 'when the cell has a White Pawn there' do
      it 'returns the White Pawn' do
        result = board.get_piece_at(Cell.for('C2'))

        expect(result).to eq(Piece.for('P'))
      end
    end

    context 'when the cell has no piece there' do
      it 'returns blank piece' do
        cell = Cell.for('D3')
        result = board.get_piece_at(cell)

        expect(result).to eq(Piece.for(''))
      end
    end
  end

  describe '#set_piece_at' do
    subject(:board) { described_class.new }

    context 'when set the piece White Rook at a3' do
      it 'has the white rook at A3' do
        cell = Cell.for('A3')
        white_rook = Piece.for('R')
        board.set_piece_at(cell, white_rook)

        result = board.get_piece_at(cell)
        expect(result).to eq(white_rook)
      end
    end
  end

  describe "#clear_piece_at" do
    subject(:board) { described_class.new }

    context 'when delete the cell a3' do
      it 'the cell contains blank piece after' do
        cell = Cell.for('A3')
        board.clear_piece_at(cell)

        expected = Piece.for('')
        expect(board.clear_piece_at(cell)).to eq(Piece.for(''))
      end
    end
  end

  describe "#empty_at?" do
    subject(:board) { described_class.new }

    context 'when there is a piece at the selected cell' do
      it 'returns false' do
        cell = Cell.for('A8')
        result = board.empty_at?(cell)
        expect(result).to be false
      end
    end

    context 'when there is no piece at the selected cell' do
      it 'returns true' do
        cell = Cell.for('C1')
        result = board.empty_at?(cell)
        expect(result).to be true
      end
    end
  end
end
