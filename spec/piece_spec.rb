# frozen_string_literal: true

require_relative '../lib/library'

describe Piece do
  describe '#self.for' do
    subject(:piece_class) { described_class }
    let(:board) { double('board') }

    context 'when given the notation and the board' do
      it 'should return the corresponding instance object of its subclasses' do
        expect(piece_class.for('r')).to eq Rook.new(Color::BLACK)
        expect(piece_class.for('b')).to eq Bishop.new(Color::BLACK)
        expect(piece_class.for('n')).to eq Knight.new(Color::BLACK)
        expect(piece_class.for('q')).to eq Queen.new(Color::BLACK)
        expect(piece_class.for('k')).to eq King.new(Color::BLACK)
        expect(piece_class.for('p')).to eq BlackPawn.new
        expect(piece_class.for('R')).to eq Rook.new(Color::WHITE)
        expect(piece_class.for('B')).to eq Bishop.new(Color::WHITE)
        expect(piece_class.for('N')).to eq Knight.new(Color::WHITE)
        expect(piece_class.for('Q')).to eq Queen.new(Color::WHITE)
        expect(piece_class.for('K')).to eq King.new(Color::WHITE)
        expect(piece_class.for('P')).to eq WhitePawn.new
      end
    end
  end
end
