# frozen_string_literal: true

require_relative '../lib/library'

describe Game do
  describe '#player_able_to_castle?' do
    subject(:game) { described_class.new(board: Board.for, castle: { 'black' => castle_black, 'white' => castle_white }) }

    let(:castle_black) { instance_double(CastleStatus) }
    let(:castle_white) { instance_double(CastleStatus) }

    context 'when the method is called with color black argument' do
      xit "object at value 'black' should receive :able_to_castle_at_side? msg" do
        allow(castle_black).to receive(:able_to_castle_at_side?)
        game.player_able_to_castle?(Color::BLACK, true)
        expect(castle_black).to have_received(:able_to_castle_at_side?)
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

  describe '#change_castle_status_by_move' do
    subject(:game) { described_class.new(board:) }

    let(:move) { instance_double(Move) }
    let(:board) { instance_double(Board) }

    it 'changes castle_status of corrresponding color to be same as move.castle_status_after_move' do
      allow(board).to receive(:get_color_at).and_return(Color::BLACK)
      new_cs = instance_double(CastleStatusForColor, color: Color::BLACK)
      allow(move).to receive(:castle_status_after_move).and_return(new_cs)
      allow(move).to receive(:origin)
      allow(move).to receive(:target)
      game.change_castle_status_by_move(move)
      expect(game.castle_status.get_status_by_color(Color::BLACK)).to eql new_cs
    end
  end
end
