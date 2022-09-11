# frozen_string_lxiteral: true

require_relative '../lib/library'

describe CastleStatus do
  subject(:castle) { described_class.new }

  describe '#mark_king_moved' do
    context 'when black king is marked moved' do
      subject(:castle_black) { described_class.new(color: Color::BLACK) }

      it 'queenside is not able to castle' do
        castle_after_king_moved = castle_black.mark_king_moved
        result = castle_after_king_moved.able_to_castle_at_side?(true)
        expect(result).to be false
      end

      it 'kingside is not able to castle' do
        castle_after_king_moved = castle_black.mark_king_moved
        result = castle_after_king_moved.able_to_castle_at_side?(false)
        expect(result).to be false
      end
    end
  end

  describe '#mark_rook_moved' do
    context 'when white kingside rook is marked moved' do
      subject(:castle_white) { described_class.new(color: Color::WHITE) }

      it 'kingside is not able to castle' do
        castle_after_kingside_rook_moved = castle_white.mark_rook_moved(true)
        result = castle_after_kingside_rook_moved.able_to_castle_at_side?(true)
        expect(result).to be false
      end
    end

    context 'when WHITE queenside rook is marked moved' do
      subject(:castle_white) { described_class.new(color: Color::WHITE) }

      it 'queenside is not able to castle' do
        castle_after_queenside_rook_moved = castle_white.mark_rook_moved(false)
        result = castle_after_queenside_rook_moved.able_to_castle_at_side?(false)
        expect(result).to be false
      end
    end
  end

  describe '#able_to_castle_at_side?' do
    context 'when quenside is not able to castle' do
      subject(:castle_white) { described_class.new(color: Color::WHITE, castle_avail: { 'Q' => false, 'K' => true }) }

      it 'returns false' do
        result = castle_white.able_to_castle_at_side?(false)
        expect(result).to be false
      end
    end

    context 'when quenside is able to castle' do
      subject(:castle_white) { described_class.new(color: Color::WHITE, castle_avail: { 'Q' => true, 'K' => true }) }

      it 'returns true' do
        result = castle_white.able_to_castle_at_side?(false)
        expect(result).to be true
      end
    end

    context 'when kingside is not able to castle' do
      subject(:castle_white) { described_class.new(color: Color::WHITE, castle_avail: { 'Q' => true, 'K' => false }) }

      it 'returns false' do
        result = castle_white.able_to_castle_at_side?(true)
        expect(result).to be false
      end
    end

    context 'when kignside is able to castle' do
      subject(:castle_white) { described_class.new(color: Color::WHITE, castle_avail: { 'Q' => true, 'K' => true }) }

      it 'returns true' do
        result = castle_white.able_to_castle_at_side?(true)
        expect(result).to be true
      end
    end
  end

  describe ':json_create' do
    context 'when the object is converted to json' do
      subject(:castle_json) { described_class.new(color: Color::WHITE, castle_avail: { 'Q' => true, 'K' => false }) }

      it 'is able to converted back' do
        json = JSON.generate(castle_json)
        result = JSON.parse(json, create_additions: true)
        expect(result).to eql castle_json
      end
    end
  end

  describe '#to_notation' do
    context 'when the both is able to castle and color is white' do
      subject(:cs_notation) { described_class.new(color: Color::WHITE, castle_avail: { 'Q' => true, 'K' => true }) }

      it 'returns KQ' do
        result = cs_notation.to_notation
        expect(result).to eq 'KQ'
      end
    end

    context 'when the both is able to castle and color is black' do
      subject(:cs_notation) { described_class.new(color: Color::BLACK, castle_avail: { 'Q' => true, 'K' => true }) }

      it 'returns kq' do
        result = cs_notation.to_notation
        expect(result).to eq 'kq'
      end
    end

    context 'when only kingside is able to castle and color is white' do
      subject(:cs_notation) { described_class.new(color: Color::WHITE, castle_avail: { 'Q' => false, 'K' => true }) }

      it 'returns K' do
        result = cs_notation.to_notation
        expect(result).to eq 'K'
      end
    end

    context 'when only queenside is able to castle and color is black' do
      subject(:cs_notation) { described_class.new(color: Color::BLACK, castle_avail: { 'Q' => true, 'K' => false }) }

      it 'returns q' do
        result = cs_notation.to_notation
        expect(result).to eq 'q'
      end
    end

    context 'when no side is able to castle and color is white' do
      subject(:cs_notation) { described_class.new(color: Color::WHITE, castle_avail: { 'Q' => false, 'K' => false }) }

      it 'returns empty string' do
        result = cs_notation.to_notation
        expect(result).to eq ''
      end
    end

    context 'when no side is able to castle and color is black' do
      subject(:cs_notation) { described_class.new(color: Color::BLACK, castle_avail: { 'Q' => false, 'K' => false }) }

      it 'returns empty string' do
        result = cs_notation.to_notation
        expect(result).to eq ''
      end
    end
  end
end