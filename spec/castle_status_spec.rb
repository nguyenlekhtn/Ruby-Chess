# frozen_string_literal: true

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

  describe '#get_status_by_color' do
    subject(:cs_get) { described_class.new(black: black_status, white: white_status) }

    let(:black_status) { double('status_color') }
    let(:white_status) { double('status_color') }

    context 'when input color black' do
      it 'returns black status' do
        expect(cs_get.get_status_by_color(Color::BLACK)).to eq black_status
      end
    end

    context 'when input color white' do
      it 'returns white status' do
        expect(cs_get.get_status_by_color(Color::WHITE)).to eq white_status
      end
    end
  end

  describe '#set_status_by_color' do
    subject(:cs_set) { described_class.new }

    let(:black_status) { instance_double(CastleStatusForColor, color: Color::BLACK) }
    let(:white_status) { instance_double(CastleStatusForColor, color: Color::WHITE) }

    context 'when input a black status' do
      it 'set black_side to this' do
        cs_set.set_status_by_color(black_status)
        expect(cs_set.black_side).to eql black_status
      end
    end

    context 'when input a white status' do
      it 'set white_side to this' do
        cs_set.set_status_by_color(white_status)
        expect(cs_set.white_side).to eql white_status
      end
    end
  end
end
