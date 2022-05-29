require_relative '../../lib/library'
require_relative '../validator_interface_spec'

describe KingMoveValidator do
  describe '#valid?' do
    let(:board) { double('board') }
    subject(:validator) { described_class.new(board) }

    context 'when KingMoveValidator is a child of Validator' do
      include_examples 'has validator interface'
    end

    context 'when start_pos at the center of the board' do
      it 'should be true when end_pos is a knight move from start_pos' do
        start_pos = Cell.for('D4')

        expect(validator.valid?(start_pos, Cell.for('C4'))).to be true
        expect(validator.valid?(start_pos, Cell.for('E4'))).to be true
        expect(validator.valid?(start_pos, Cell.for('D3'))).to be true
        expect(validator.valid?(start_pos, Cell.for('D5'))).to be true
      end

      it 'should be false when end_pos is not a king move from start_pos' do
        start_pos = Cell.for('D4')

        expect(validator.valid?(start_pos, Cell.for('E1'))).to be false
      end
    end
  end
end