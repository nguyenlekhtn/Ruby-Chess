# frozen_string_literal: true

require_relative '../../lib/library'
require_relative '../generator_interface_spec'

describe WhitePawnCaptureMoveGenerator do
  subject(:generator) { described_class.new(game) }

  let(:game) { Game.new(board:) }

  context 'when the subject acts as a generator' do
    let(:board) { Board.for }

    include_examples 'implement the generator interface'
  end

  describe '#cells' do
    context 'when 2 forward diagonal cells both have oppopsite pieces' do
      let(:board) { Board.for('8/8/8/8/8/3b1b2/4P3/8') }

      it 'returns them' do
        expected = [Cell.for('D3'), Cell.for('F3')]
        result = generator.cells(Cell.for('E2'))
        expect(result).to match_array expected
      end
    end

    context 'when 2 forward diagonal cells none have oppopsite pieces' do
      let(:board) { Board.for('8/8/8/8/8/8/4P3/8') }

      it 'returns empty array' do
        expected = []
        result = generator.cells(Cell.for('E2'))
        expect(result).to match_array expected
      end
    end
  end
end
