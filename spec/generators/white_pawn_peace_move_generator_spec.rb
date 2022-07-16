require_relative '../../lib/library'
require_relative '../generator_interface_spec'

describe WhitePawnPeaceMoveGenerator do
  subject(:generator) { described_class.new(game) }
  let(:game) { Game.new(board:) }

  context 'when the subject acts as a generator' do
    let(:board) { Board.for }
    include_examples 'implement the generator interface'
  end

  describe '#cells' do
    context "if piece hasn't move and no piece in its path" do
      let(:board) { Board.for('8/8/8/8/8/8/1P6/8') }

      it 'should return them' do  
        expected = [Cell.for('B3'), Cell.for('B4')]
        result = generator.cells(Cell.for('B2'))
        expect(result).to match_array expected
      end
    end

    context "if piece hasn't move and there is a piece in front of it" do
      let(:board) { Board.for('8/8/8/8/8/1p6/1P6/8') }

      it 'can not move' do  
        expected = []
        result = generator.cells(Cell.for('B2'))
        expect(result).to match_array expected
      end
    end

    context "if piece moved" do
      let(:board) { Board.for('8/8/8/8/8/1P6/8/8') }

      it 'can only one step at a time' do  
        expected = [Cell.for('B4')]
        result = generator.cells(Cell.for('B3'))
        expect(result).to match_array expected 
      end
    end
  end
end