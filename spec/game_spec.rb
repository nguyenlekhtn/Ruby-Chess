# frozen_string_literal: true

require_relative '../lib/library'

describe Game do
  describe '#get_positions_from_input' do
    subject(:game) { Game.new(board: Board.new(notation: 'rnbqkbnr/1ppppppp/1p6/8/8/8/1PPPPPPP/RNBQKBNR')) }

    context 'when give input A1A8' do
      it 'retuns Cell A1 and Cell A8' do
        result = game.get_positions_from_input('A1A8')
        expected = [Cell.for('A1'), Cell.for('A8')]

        expect(result).to eq expected
      end
    end

    context 'when give input H1H8' do
      it 'retuns Cell H1 and Cell H8' do
        result = game.get_positions_from_input('H1H8')
        expected = [Cell.for('H1'), Cell.for('H8')]

        expect(result).to eq expected
      end
    end

    context 'when give out-of-range input' do
      it 'retuns nil' do
        result = game.get_positions_from_input('E1D9')
        expected = nil

        expect(result).to be nil
      end
    end
  end

  describe '#move_valid?' do

    context 'when the board is at starting position and the move is D2 to D3' do
      subject(:game) { described_class.new(board: Board.for('rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR')) }

      it 'should be a valid move' do
        result = game.move_valid?(Cell.for('D2'), Cell.for('D3'))
        expect(result).to be true
      end
    end

    context 'when the board is at starting position and the move is E2 to D4' do
      subject(:game) { described_class.new(board: Board.for('rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR')) }

      it 'should be a valid move' do
        result = game.move_valid?(Cell.for('E2'), Cell.for('E4'))
        expect(result).to be true
      end
    end

    context 'when the board is at starting position and the move is D1 to F3' do
      subject(:game) { described_class.new(board: Board.for('rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR')) }

      it 'should be an invalid move' do
        result = game.move_valid?(Cell.for('D1'), Cell.for('F3'))
        expect(result).to be false
      end
    end
  end
end
