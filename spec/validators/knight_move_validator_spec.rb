require_relative '../../lib/library'
require_relative '../validator_interface_spec'

describe KnightMoveValidator do
  describe '#valid?' do
    let(:board) { double('board') }
    subject(:validator) { described_class.new(board) }

    context 'when KnightMoveValidator is a child of Validator' do
      include_examples 'has validator interface'
    end

    context 'when start_pos at the center of the board' do
      it 'should be true when end_pos is a knight move from start_pos' do
        start_pos = Cell.for('D4')

        expect(validator.valid?(start_pos, Cell.for('C2'))).to be true
        expect(validator.valid?(start_pos, Cell.for('B3'))).to be true
        expect(validator.valid?(start_pos, Cell.for('B5'))).to be true
        expect(validator.valid?(start_pos, Cell.for('C6'))).to be true
        expect(validator.valid?(start_pos, Cell.for('E6'))).to be true
        expect(validator.valid?(start_pos, Cell.for('F5'))).to be true
        expect(validator.valid?(start_pos, Cell.for('F3'))).to be true
        expect(validator.valid?(start_pos, Cell.for('E2'))).to be true
      end

      it 'should be false when end_pos is not a knight move from start_pos' do
        start_pos = Cell.for('D4')

        expect(validator.valid?(start_pos, Cell.for('E1'))).to be false
      end
    end
  end
end