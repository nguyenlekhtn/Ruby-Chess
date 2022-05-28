# frozen_string_literal: true

require_relative '../lib/library'

describe BoardBuilder do
  describe '#row' do
    let(:board) { double('board') }
    subject(:builder) { BoardBuilder.new(board) }

    context 'give the number 8 only' do
      it 'return an array of blank pieces' do
        string = '8'
        result = builder.row(string)

        expect(result).to match_array(Array.new(8) { Piece.for('', board) })
      end
    end

    context 'give the initial string at row 1' do
      it 'return an array of inital pieces at row 1' do
        string = 'RNBQKBNR'
        result = builder.row(string)
        expected = 'RNBQKBNR'.chars.map { |char| Piece.for(char, board) }

        expect(result).to match_array(expected)
      end
    end

    context 'give the string "PQp2Bp1"' do
      it 'returns the correct array' do
        string = 'PQp2Bp1'
        result = builder.row(string)
        expected = [Piece.for('P', board), Piece.for('Q', board), Piece.for('p', board), Piece.for('', board), Piece.for('', board), Piece.for('B', board), Piece.for('p', board), Piece.for('', board)]

        expect(result).to match_array(expected)
      end
    end
  end

  describe '#whole' do
    let(:board) { double('board') }
    subject(:builder) { BoardBuilder.new(board) }

    context 'when give the initial board string "string"' do
      it 'returns the initial board array' do
        string = 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR'
        result = builder.whole(string)

        expected = [
          [Piece.for('R', board), Piece.for('N', board), Piece.for('B', board), Piece.for('Q', board), Piece.for('K', board), Piece.for('B', board), Piece.for('N', board), Piece.for('R', board)],
          [Piece.for('P', board), Piece.for('P', board), Piece.for('P', board), Piece.for('P', board), Piece.for('P', board), Piece.for('P', board), Piece.for('P', board), Piece.for('P', board)],
          [Piece.for('', board), Piece.for('', board), Piece.for('', board), Piece.for('', board), Piece.for('', board), Piece.for('', board), Piece.for('', board), Piece.for('', board)],
          [Piece.for('', board), Piece.for('', board), Piece.for('', board), Piece.for('', board), Piece.for('', board), Piece.for('', board), Piece.for('', board), Piece.for('', board)],
          [Piece.for('', board), Piece.for('', board), Piece.for('', board), Piece.for('', board), Piece.for('', board), Piece.for('', board), Piece.for('', board), Piece.for('', board)],
          [Piece.for('', board), Piece.for('', board), Piece.for('', board), Piece.for('', board), Piece.for('', board), Piece.for('', board), Piece.for('', board), Piece.for('', board)],
          [Piece.for('p', board), Piece.for('p', board), Piece.for('p', board), Piece.for('p', board), Piece.for('p', board), Piece.for('p', board), Piece.for('p', board), Piece.for('p', board)],
          [Piece.for('r', board), Piece.for('n', board), Piece.for('b', board), Piece.for('q', board), Piece.for('k', board), Piece.for('b', board), Piece.for('n', board), Piece.for('r', board)]
        ]
        (0..7).each do |i|
          expect(result[i]).to match_array(expected[i])
        end
      end
    end
  end
end
