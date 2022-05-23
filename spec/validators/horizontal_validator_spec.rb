require_relative '../../lib/library'
require_relative '../validator_interface_spec'

describe HorizontalValidator do
  let(:board) { Board.new }
  subject(:validator) { described_class.new(board) }

  context 'when HorizontalValidator is a child of Validator' do
    include_examples 'has validator interface'
  end

  describe '#valid?' do
    let(:cell1) { instance_double(Cell) }
    let(:cell2) { instance_double(Cell) }

    context 'when 2 cells are not in the same horizontal line' do
      it 'returns false' do
        allow(cell1).to receive(:same_horizontal_line_with_cell?).and_return(false)

        result = validator.valid?(cell1, cell2)
        expect(result).to be false
      end
    end

    context 'when 2 cells are in the same horizontal line' do
      before do
        allow(cell1).to receive(:same_horizontal_line_with_cell?).and_return(true)
      end

      xit 'returns true if no piece is in between' do
        cell_a = instance_double(Cell, row: 1, col: 2)
        cell_b = instance_double(Cell, row: 1, col: 7)
        allow(board).to receive(:no_piece_in_horizontal_line_between_2_cells?)
                    .with(row: 1, cols: [2, 7]).and_return(true)
        result = validator.valid?(cell_a, cell_b)
        expect(result).to be true
      end
    end
  end
end
