# frozen_string_literal: true

require_relative '../lib/library'

describe Game do
  describe '#player_can_castle?' do
    subject(:game) { described_class.new(board: Board.for, castle: { 'black' => { queenside: true, kingside: true },
                                                                     'white' => { queenside: true, kingside: false } }) }

    context 'when white can castle queenside' do
      it 'returns true' do
        result = game.player_can_castle?(color: Color::WHITE, side: :queenside)

        expect(result).to be true
      end
    end

    context 'when black can not castle queenside' do
      it 'returns true' do
        result = game.player_can_castle?(color: Color::WHITE, side: :queenside)

        expect(result).to be true
      end
    end
  end

  describe '#change_board_by_move' do
    subject(:game) { described_class.new(board: Board.for) }

    let(:move) { instance_double(Move) }

    it 'changes board to be same as move.board_after_move' do
      new_board = Board.for('rnbqkbnr/pppppppp/8/8/8/4P3/PPPP1PPP/RNBQKBNR')
      allow(move).to receive(:board_after_move).and_return(new_board)
      expect { game.change_board_by_move(move) }.to change(game, :board).to(new_board)
    end
  end
end
