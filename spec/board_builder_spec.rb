# frozen_string_literal: true

require_relative '../lib/library'

describe BoardBuilder do
  describe '#row' do
    subject(:builder) { BoardBuilder.new }

    context 'give the number 8 only' do
      it 'return an array of blank pieces' do
        string = '8'
        result = builder.row(string)

        expect(result).to match_array(Array.new(8) { Piece.for('') })
      end
    end

    context 'give the initial string at row 1' do
      it 'return an array of inital pieces at row 1' do
        string = 'RNBQKBNR'
        result = builder.row(string)
        expected = 'RNBQKBNR'.chars.map { |char| Piece.for(char) }

        expect(result).to match_array(expected)
      end
    end

    context 'give the string "PQp2Bp1"' do
      it 'returns the correct array' do
        string = 'PQp2Bp1'
        result = builder.row(string)
        expected = [Piece.for('P'), Piece.for('Q'), Piece.for('p'), Piece.for(''), Piece.for(''), Piece.for('B'), Piece.for('p'), Piece.for('')]

        expect(result).to match_array(expected)
      end
    end
  end

  describe '#whole' do
    subject(:builder) { BoardBuilder.new }

    context 'when give the initial board string "string"' do
      it 'returns the initial board array' do
        string = 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR'
        result = builder.whole(string)

        expected = [
          [Piece.for('R'), Piece.for('N'), Piece.for('B'), Piece.for('Q'), Piece.for('K'), Piece.for('B'), Piece.for('N'), Piece.for('R')],
          [Piece.for('P'), Piece.for('P'), Piece.for('P'), Piece.for('P'), Piece.for('P'), Piece.for('P'), Piece.for('P'), Piece.for('P')],
          [Piece.for(''), Piece.for(''), Piece.for(''), Piece.for(''), Piece.for(''), Piece.for(''), Piece.for(''), Piece.for('')],
          [Piece.for(''), Piece.for(''), Piece.for(''), Piece.for(''), Piece.for(''), Piece.for(''), Piece.for(''), Piece.for('')],
          [Piece.for(''), Piece.for(''), Piece.for(''), Piece.for(''), Piece.for(''), Piece.for(''), Piece.for(''), Piece.for('')],
          [Piece.for(''), Piece.for(''), Piece.for(''), Piece.for(''), Piece.for(''), Piece.for(''), Piece.for(''), Piece.for('')],
          [Piece.for('p'), Piece.for('p'), Piece.for('p'), Piece.for('p'), Piece.for('p'), Piece.for('p'), Piece.for('p'), Piece.for('p')],
          [Piece.for('r'), Piece.for('n'), Piece.for('b'), Piece.for('q'), Piece.for('k'), Piece.for('b'), Piece.for('n'), Piece.for('r')]
        ]
        (0..7).each do |i|
          expect(result[i]).to match_array(expected[i])
        end
      end
    end
  end
end
