# frozen_string_literal: true

require_relative '../lib/library'

describe CastleStatus do
  subject(:castle) { described_class.new }

  describe '#mark_king_moved' do
    context 'when black king is marked moved' do
      it 'the change should take affect' do
        expect { castle.mark_king_moved(Color::BLACK) }
        .to change { castle.king_not_moved?(Color::BLACK) }
        .from(true)
        .to(false)
      end
    end
  end

  describe '#mark_rook_moved' do
    context 'when white right rook is marked moved' do
      it 'the change should take affect' do
        expect { castle.mark_rook_moved(Color::WHITE, true) }
        .to change { castle.rook_not_moved?(Color::WHITE, true) }
        .from(true)
        .to(false)
      end
    end
  end

  describe '#able_to_castle?' do
    context 'when white right rook and king is not moved' do
      it 'white is to castle kingside' do
        result = castle.able_to_castle?(Color::WHITE, true)
        expect(result).to be true
      end
    end

    context 'when white right rook is marked moved' do
      it 'white is unable to castle kingside' do
        castle.mark_rook_moved(Color::WHITE, true)
        result = castle.able_to_castle?(Color::WHITE, true)
        expect(result).to be false
      end
    end

    context 'when black king is marked moved' do
      before do
        castle.mark_king_moved(Color::BLACK)
      end

      it 'black is unable to castle kingside' do
        result = castle.able_to_castle?(Color::BLACK, true)
        expect(result).to be false
      end

      it 'black is unable to castle kingside' do
        castle.mark_king_moved(Color::BLACK)
        result = castle.able_to_castle?(Color::BLACK, false)
        expect(result).to be false
      end
    end
  end
end