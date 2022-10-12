# frozen_string_literal: true

require_relative '../../lib/library'
require_relative '../generator_interface_spec'

describe KingsideCastlingGenerator do
  describe '#able_to_castle?' do
    subject(:generator) { described_class.new(game, WhiteSide.new) }

    let(:game) { Game.new(board:) }

    context 'when the subject acts as a generator' do
      let(:board) { Board.for }

      include_examples 'implement the generator interface'
    end

    context 'when white king is not in default position' do
      let(:board) { Board.for('2k5/8/8/8/8/2B1N3/PPP1KPPP/RNBQ3R') }

      it 'is not able to castle kingside' do
        result = generator.able_to_castle?

        expect(result).to be false
      end
    end

    context 'when white rook is not in default position' do
      let(:board) { Board.for('2k5/8/8/8/8/2B1N3/PPP1RPPP/RNBQK3') }

      it 'is not able to castle kingside' do
        result = generator.able_to_castle?

        expect(result).to be false
      end
    end

    context 'when white king is in check' do
      let(:board) { Board.for('4k3/8/8/8/1b6/3B1N2/PPP2PPP/RNBQK2R') }

      it 'is not able to castle' do
        result = generator.able_to_castle?

        expect(result).to be false
      end
    end

    context 'when there is a square in between that is attacked by an enemy piece' do
      let(:board) { Board.for('4k3/8/b7/8/3PP3/5N2/PPP2PPP/RNBQK2R') }

      it 'is not able to castle' do
        result = generator.able_to_castle?

        expect(result).to be false
      end
    end

    context 'when any piece between rook and king is not empty' do
      let(:board) { Board.for('4k3/4n3/8/8/2BP4/2N5/PPP1QPPP/R3K1NR') }

      it 'is not able to castle kingside' do
        result = generator.able_to_castle?

        expect(result).to be false
      end
    end

    context 'when all conditions for white are satisfied' do
      let(:board) { Board.for('4k3/4n3/8/8/2BP4/2N2N2/PPP1QPPP/R3K2R') }

      it 'white player is able to castle kingside' do
        result = generator.able_to_castle?

        expect(result).to be true
      end
    end

    context 'when all conditions for black are satisfied' do
      subject(:generator) { described_class.new(game, BlackSide.new) }

      let(:board) { Board.for('4k2r/pppppppp/8/8/8/8/8/4K3') }

      it 'black player is able to castle kingside' do
        result = generator.able_to_castle?

        expect(result).to be true
      end
    end
  end
end
