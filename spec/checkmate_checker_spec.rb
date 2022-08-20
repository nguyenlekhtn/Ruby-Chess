# frozen_string_literal: true

require_relative '../lib/library'

describe CheckmateChecker do
  describe '#checkmated?' do
    subject(:checker) { described_class.new(board) }

    context 'when black is checkmated,' do
      let(:color) { Color::BLACK }
      let(:board) { Board.for('rnbqkbnr/ppppp2p/8/5ppQ/4P3/2N5/PPPP1PPP/R1B1KBNR') }

      xit 'returns true' do
        result = checker.checkmated?(color)
        expect(result).to be true
      end
    end

    context 'when white is not checkmated' do
      let(:color) { Color::WHITE }
      let(:board) { Board.for('1Q6/5pk1/2p3p1/1p2N2p/1b5P/1bn5/r5P1/1K6') }

      xit 'returns false' do
        result = checker.checkmated?(color)
        expect(result).to be false
      end
    end

    context 'when white is checkmated' do \
      let(:color) { Color::WHITE }
      let(:board) { Board.for('1Q6/5pk1/2p3p1/1p2N2p/1b5P/1bn5/2r3P1/2K5') }

      xit 'returns true' do
        result = checker.checkmated?(color)
        expect(result).to be true
      end
    end
  end
end
