require_relative '../lib/main'

describe Piece do
  describe 'self.for' do
    context 'when give "R"' do
      it 'returns white rook' do
        result = Piece.for('R')

        expect(result).to eq Rook.new('white')
      end
    end

    context 'when give "p"' do
      it 'returns black pawm' do
        result = Piece.for('p')

        expect(result).to eq BlackPawn.new
      end
    end

    context 'when give empty string' do
      it 'return blank piece' do
        result = Piece.for('')

        expect(result).to eq BlankPiece.new
      end
    end
  end
end