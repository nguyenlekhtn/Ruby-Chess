require_relative '../../lib/library'
require_relative '../validator_interface_spec'

describe DifferentColorValidator do
  let(:board) { instance_double(Board) }
  subject(:validator) { described_class.new(board) }

  context 'when DifferentColorValidator is a child of Validator' do
    include_examples 'has validator interface'
  end

  describe '#valid?' do
    let(:cell1) { instance_double(Cell) }
    let(:cell2) { instance_double(Cell) }

    context 'when 2 cells have different color' do
      it 'returns true' do
        allow(board).to receive(:same_color_between_two_positions?).and_return(false)

        result = validator.valid?(cell1, cell2)
        expect(result).to be true
      end
    end

    context 'when 2 cells have same color' do
      it 'returns true' do
        allow(board).to receive(:same_color_between_two_positions?).and_return(true)

        result = validator.valid?(cell1, cell2)
        expect(result).to be false
      end
    end
  end
end
