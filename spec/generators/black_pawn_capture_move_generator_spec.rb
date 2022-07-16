require_relative '../../lib/library'
require_relative '../generator_interface_spec'

describe BlackPawnCaptureMoveGenerator do
  subject(:generator) { described_class.new(game) }
  let(:game) { Game.new(board:)}

  context 'when the subject acts as a generator' do
    let(:board) { Board.for }
    include_examples 'implement the generator interface'
  end

  describe '#cells' do
    context 'if 2 forward diagonal cells both have oppopsite pieces' do
      let(:board) { Board.for('8/5p2/4B1B1/8/8/8/8/8') }
      it 'should return them' do  
        expected = [Cell.for('E6'), Cell.for('G6')]
        result = generator.cells(Cell.for('F7'))
        expect(result).to match_array expected
      end
    end

    context 'if 2 forward diagonal cells none have oppopsite pieces' do
      let(:board) { Board.for('8/5p2/8/8/8/8/8/8') }
      it 'should return empty array' do  
        expected = []
        result = generator.cells(Cell.for('F7'))
        expect(result).to match_array expected

      end
    end
  end
end