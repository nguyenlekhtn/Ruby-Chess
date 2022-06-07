# frozen_string_literal: true

require_relative '../lib/library'

describe Piece do
  describe '#self.for' do
    subject(:piece_class) { described_class }
    let(:board) { double('board') }

    context 'when given the notation and the board' do
      it 'should return the corresponding instance object of its subclasses' do
        expect(piece_class.for('r', board)).to eq Rook.new(Color::BLACK, board)
        expect(piece_class.for('b', board)).to eq Bishop.new(Color::BLACK, board)
        expect(piece_class.for('n', board)).to eq Knight.new(Color::BLACK, board)
        expect(piece_class.for('q', board)).to eq Queen.new(Color::BLACK, board)
        expect(piece_class.for('k', board)).to eq King.new(Color::BLACK, board)
        expect(piece_class.for('p', board)).to eq BlackPawn.new(board)
        expect(piece_class.for('R', board)).to eq Rook.new(Color::WHITE, board)
        expect(piece_class.for('B', board)).to eq Bishop.new(Color::WHITE, board)
        expect(piece_class.for('N', board)).to eq Knight.new(Color::WHITE, board)
        expect(piece_class.for('Q', board)).to eq Queen.new(Color::WHITE, board)
        expect(piece_class.for('K', board)).to eq King.new(Color::WHITE, board)
        expect(piece_class.for('P', board)).to eq WhitePawn.new(board)
      end
    end
  end
end