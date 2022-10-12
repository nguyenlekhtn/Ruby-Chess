# frozen_string_literal: true

require_relative '../lib/library'

describe HalfMove do
  subject(:half_move) { described_class.new(game) }

  describe '#play' do
    let(:game) { Game.new(board:, color:) }

    context 'when the current player is checkmated' do
      let(:board) { Board.for('2k4R/5R2/8/8/8/2K5/7p/8') }
      let(:color) { Color::BLACK }

      it 'returns :checkmated' do
        result = half_move.play
        expected = :checkmated

        expect(result).to eq expected
      end
    end

    context 'when the current player is stalemated' do
      let(:board) { Board.for('8/1R6/8/8/p3P3/k4K2/3R4/8') }
      let(:color) { Color::BLACK }

      it "returns ':stalemated" do
        result = half_move.play
        expected = :stalemated

        expect(result).to eq expected
      end
    end

    context 'when the current player made a move' do
      let(:board) { Board.for('rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR') }
      let(:color) { Color::WHITE }

      before do
        allow(half_move).to receive(:gets).and_return('E2', 'E4')
        allow(half_move).to receive(:puts)
      end

      it 'returns :continue' do
        result = half_move.play
        expected = :continue

        expect(result).to eq expected
      end
    end
  end
end
