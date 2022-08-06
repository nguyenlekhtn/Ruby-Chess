require_relative '../../lib/library'
require_relative '../generator_interface_spec'

describe WhiteKingsideCastlingGenerator do

  describe '#able_to_castle?' do
    let(:generator) { described_class.new(game) }
    let(:game) { Game.new(board:)}

    context 'if white king is not in default position' do
      let(:board) { Board.for('2k5/8/8/8/8/2B1N3/PPP1KPPP/RNBQ3R') }

      it 'is not able to castle kingside' do
        result = generator.able_to_castle?

        expect(result).to be false
      end
    end

    context 'if white rook is not in default position' do
      let(:board) { Board.for('2k5/8/8/8/8/2B1N3/PPP1RPPP/RNBQK3') }

      it 'is not able to castle kingside' do
        result = generator.able_to_castle?

        expect(result).to be false
      end
    end

    context 'if white king is in check' do
      let(:board) { Board.for('4k3/8/8/8/1b6/3B1N2/PPP2PPP/RNBQK2R') }

      it 'is not able to castle' do
        result = generator.able_to_castle?

        expect(result).to be false
      end
    end

    context 'when all conditions are satisfied' do
      let(:board) { Board.for('4k3/4n3/8/8/2BP4/2N2N2/PPP1QPPP/R3K2R') }

      it 'is able to castle kingside' do
        result = generator.able_to_castle?

        expect(result).to be true
      end
    end
  end
end