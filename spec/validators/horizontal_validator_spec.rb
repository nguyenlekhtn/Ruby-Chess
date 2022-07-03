require_relative '../../lib/library'
require_relative '../validator_interface_spec'

describe HorizontalValidator do
  let(:board) { instance_double(Board) }
  subject(:validator) { described_class.new(board) }

  context 'when HorizontalValidator is a child of Validator' do
    include_examples 'has validator interface'
  end

  describe '#valid?' do
    let(:cell1) { instance_double(Cell) }
    let(:cell2) { instance_double(Cell) }

    # context 'when 2 cells are not in the same horizontal line' do
    #   let(:cell1) { Cell.new(2, 2) }
    #   let(:cell2) { Cell.new(3, 2) }

    #   it 'returns false' do
    #     result = validator.valid?(cell1, cell2)
    #     expect(result).to be false
    #   end
    # end

    context 'when 2 cells are in the same horizontal line' do
      let(:cell_a) { Cell.new(2, 8) }
      let(:cell_b) { Cell.new(2, 6) }

      it 'returns true if no piece is in between' do
        allow(board).to receive(:no_piece_in_horizontal_line_between_2_cells?)
                    .with(cell_a, cell_b).and_return(true)
        result = validator.valid?(cell_a, cell_b)
        expect(result).to be true
      end

      it 'returns false if there are pieces is in between' do
        allow(board).to receive(:no_piece_in_horizontal_line_between_2_cells?)
                    .with(cell_a, cell_b).and_return(false)
        result = validator.valid?(cell_a, cell_b)
        expect(result).to be false
      end
    end
  end
end
