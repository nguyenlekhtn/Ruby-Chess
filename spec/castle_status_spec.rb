# frozen_string_lxiteral: true

require_relative '../lib/library'

describe CastleStatus do

  describe '#mark_rook_moved' do
    subject(:cs_mark_rook) { described_class.new(black:, white:) }
    let(:black) { instance_double(CastleStatusForColor) }
    let(:white) { instance_double(CastleStatusForColor) }

    context 'when method is invoked with color white and kingside' do


      it 'white_side will receive :mark_rook_moved with argument true' do
        allow(white).to receive(:mark_rook_moved)
        cs_mark_rook.mark_rook_moved(Color::WHITE, true)
        expect(white).to have_received(:mark_rook_moved).with(true)
      end
    end
  end

  describe '#mark_king_moved' do
    subject(:cs_mark_king) { described_class.new(black:, white:) }
    let(:black) { instance_double(CastleStatusForColor) }
    let(:white) { instance_double(CastleStatusForColor) }

    context 'when method is invoked with color white' do

      it 'white_side will receive :mark_rook_moved with argument true' do
        allow(white).to receive(:mark_king_moved)
        cs_mark_king.mark_king_moved(Color::WHITE)
        expect(white).to have_received(:mark_king_moved)
      end
    end
  end

  describe '#to_notation' do
    subject(:cs_notation) { described_class.new(black:, white:) }

    context 'when WHITE and BLACK both can be castled both side' do
      let(:black) { CastleStatusForColor.new(color: Color::BLACK) }
      let(:white) { CastleStatusForColor.new(color: Color::WHITE) }

      it 'returns KQkq' do
        result = cs_notation.to_notation
        expect(result).to eq 'KQkq'
      end
    end

    context 'when neither WHITE or BLACK player can be castled any side' do
      let(:black) { CastleStatusForColor.new(color: Color::BLACK, castle_avail: { 'Q' => false, 'K' => false }) }
      let(:white) { CastleStatusForColor.new(color: Color::WHITE, castle_avail: { 'Q' => false, 'K' => false }) }

      it 'returns -' do
        result = cs_notation.to_notation
        expect(result).to eq '-'
      end
    end

    context 'when WHITE can only castle kingside and BLACK can only castle queenside' do
      let(:black) { CastleStatusForColor.new(color: Color::BLACK, castle_avail: { 'Q' => true, 'K' => false }) }
      let(:white) { CastleStatusForColor.new(color: Color::WHITE, castle_avail: { 'Q' => false, 'K' => true }) }

      it 'returns Kq' do
        result = cs_notation.to_notation
        expect(result).to eq 'Kq'
      end
    end

  end
end