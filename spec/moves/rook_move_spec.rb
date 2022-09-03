require_relative '../../lib/library'

describe RookMove do
  describe '#castle_status_after_move' do
    context 'when a white queenside rook is moved from its default position' do
      subject(:rook_move_castle) { described_class.new(origin: Cell.for('A1'), target: Cell.for('A2')) }
      let(:castle_status) { instance_double(CastleStatus, color: Color::WHITE) }

      it "sends mark_rook_moved msg to the method's argument with argument false" do
        allow(castle_status).to receive(:mark_rook_moved)
        rook_move_castle.castle_status_after_move(castle_status)

        expect(castle_status).to have_received(:mark_rook_moved).with(false)
      end
    end

    context 'when a black kingside rook is moved from its default position' do
      subject(:rook_move_castle) { described_class.new(origin: Cell.for('H8'), target: Cell.for('H7')) }
      let(:castle_status) { instance_double(CastleStatus, color: Color::BLACK) }

      it "sends mark_rook_moved msg to the method's argument with argument false" do
        allow(castle_status).to receive(:mark_rook_moved)
        rook_move_castle.castle_status_after_move(castle_status)

        expect(castle_status).to have_received(:mark_rook_moved).with(true)
      end
    end
  end
end