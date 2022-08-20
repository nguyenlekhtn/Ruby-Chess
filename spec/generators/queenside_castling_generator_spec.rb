# frozen_string_literal: true

require_relative '../../lib/library'
require_relative '../generator_interface_spec'

describe QueensideCastlingGenerator do
  describe '#able_to_castle?' do
    subject(:generator) { described_class.new(game, BlackSide.new) }
    let(:game) { Game.new(board:) }

    context 'when the subject acts as a generator' do
      let(:board) { Board.for }
      include_examples 'implement the generator interface'
    end

    context 'if black king is not in default position' do
      let(:board) { Board.for('r6r/pppqkppp/8/8/8/2B1N3/PPP1KPPP/RNBQ3R') }

      it 'is not able to castle queenside' do
        result = generator.able_to_castle?

        expect(result).to be false
      end
    end

    context 'if white rook is not in default position' do
      let(:board) { Board.for('1r2k2r/pppq1ppp/8/8/8/2B1N3/PPP1KPPP/RNBQ3R') }

      it 'is not able to castle queenside' do
        result = generator.able_to_castle?

        expect(result).to be false
      end
    end

    context 'if white king is in check' do
      let(:board) { Board.for('r3k2r/pppq1ppp/5N2/8/8/2B5/PPP1KPPP/RNBQ3R') }

      it 'is not able to castle' do
        result = generator.able_to_castle?

        expect(result).to be false
      end
    end

    context 'if there is a square in between that is attacked by an enemy piece' do
      let(:board) { Board.for('r3k2r/pppqNppp/8/8/8/2B5/PPP1KPPP/RNBQ3R') }

      it 'is not able to castle' do
        result = generator.able_to_castle?

        expect(result).to be false
      end
    end

    context 'when any piece between rook and king is not empty' do
      let(:board) { Board.for('r2qk2r/ppp1Nppp/8/8/8/2B5/PPP1KPPP/RNBQ3R') }

      it 'is not able to castle queenside' do
        result = generator.able_to_castle?

        expect(result).to be false
      end
    end

    context 'when all conditions are satisfied' do
      let(:board) { Board.for('r3k2r/pppq1ppp/8/8/8/2B1N3/PPP1KPPP/RNBQ3R') }

      it 'is able to castle queenside' do
        result = generator.able_to_castle?

        expect(result).to be true
      end
    end
  end
end
