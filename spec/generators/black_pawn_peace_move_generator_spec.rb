# frozen_string_literal: true

require_relative '../../lib/library'
require_relative '../generator_interface_spec'

describe BlackPawnPeaceMoveGenerator do
  subject(:generator) { described_class.new(game) }

  let(:game) { Game.new(board:) }

  context 'when the subject acts as a generator' do
    let(:board) { Board.for }

    include_examples 'implement the generator interface'
  end

  describe '#cells' do
    context "when piece hasn't move and no piece in its path" do
      let(:board) { Board.for('8/1p6/8/8/8/8/8/8') }

      it 'returns them' do
        expected = [Cell.for('B6'), Cell.for('B5')]
        result = generator.cells(Cell.for('B7'))
        expect(result).to match_array expected
      end
    end

    context "when piece hasn't move and there is a piece in front of it" do
      let(:board) { Board.for('8/1p6/1P6/8/8/8/8/8') }

      it 'can not move' do
        expected = []
        result = generator.cells(Cell.for('B7'))
        expect(result).to match_array expected
      end
    end

    context 'when piece moved' do
      let(:board) { Board.for('8/1p6/1P6/8/8/8/8/8') }

      it 'can only one step at a time' do
        expected = [Cell.for('B5')]
        result = generator.cells(Cell.for('B6'))
        expect(result).to match_array expected
      end
    end
  end
end
