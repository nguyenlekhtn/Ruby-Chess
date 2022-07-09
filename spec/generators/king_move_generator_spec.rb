require_relative '../../lib/library'
require_relative '../generator_interface_spec'

describe KingMoveGenerator  do
  subject(:generator) { described_class.new(board:) }

  context 'when the subject acts as a generator' do
    let(:board) { Board.for }
    include_examples 'implement the generator interface'
  end


  describe '#cells' do
    context 'if no oppsite piece can attack its neighbors' do
      let(:board) { Board.for('8/8/8/8/3K4/8/8/8') }

      it 'generates all valid neighbours cells from origin' do
        expected = [
          Cell.for('C3'),
          Cell.for('C4'),
          Cell.for('C5'),
          Cell.for('E3'),
          Cell.for('E4'),
          Cell.for('E5'),
          Cell.for('D5'),
          Cell.for('D3')
        ]
        result = generator.cells(Cell.for('D4'))
        expect(result).to match_array expected
      end
    end

    context 'if there are oppsite pieces can attack one of its neighbors' do
      let(:board) { Board.for('8/6b1/8/8/3K4/8/8/8') }

      xit 'can not move to that cell' do
        expected = [
          Cell.for('C3'),
          Cell.for('C5'),
          Cell.for('E3'),
          Cell.for('E4'),
          Cell.for('E5'),
          Cell.for('D3')
        ]
        result = generator.cells(Cell.for('D4'))
        expect(result).to match_array expected
      end
    end
  end
end