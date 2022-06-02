require_relative '../../lib/library'
require_relative '../validator_interface_spec'

describe WhitePawnCaptureMoveValidator do
  let(:board) { instance_double(Board) }
  subject(:validator) { described_class.new(board) }

  context 'when WhitePawnCaptureMoveValidator is a child of Validator' do
    include_examples 'has validator interface'
  end

  describe '#valid?' do
    context 'when piece at end_pos is not opposite color with piece at start_pos' do
      let(:cell1) { double('cell1') }
      let(:cell2) { double('cell2') }

      it 'should return false' do
        allow(board).to receive(:opposite_color_between_2_cells?).and_return(false)
        result = validator.valid?(cell1, cell2)
        expect(result).to be false
      end
    end

    context 'when piece at end_pos has opposite color with piece at start_pos' do
      before do
        allow(board).to receive(:opposite_color_between_2_cells?).and_return(true)
      end

      it 'should return true if end_pos is at (1, -1) from start_pos' do
        cell1 = Cell.new(6, 3)
        cell2 = Cell.new(7, 2)
        result = validator.valid?(cell1, cell2)
        expect(result).to be true
      end

      it 'should return false if end_pos is not at (1, -1) from start_pos' do
        cell1 = Cell.new(6, 3)
        cell2 = Cell.new(7, 7)
        result = validator.valid?(cell1, cell2)
        expect(result).to be false
      end

      it 'should return true if end_pos is at (-1, 1) from start_pos' do
        cell1 = Cell.new(6, 3)
        cell2 = Cell.new(7, 4)
        result = validator.valid?(cell1, cell2)
        expect(result).to be true
      end

      it 'should return false if end_pos is not at (-1, 1) from start_pos' do
        cell1 = Cell.new(6, 3)
        cell2 = Cell.new(7, 7)
        result = validator.valid?(cell1, cell2)
        expect(result).to be false
      end
    end
  end
end