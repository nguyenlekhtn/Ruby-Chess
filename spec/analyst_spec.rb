# frozen_string_literal: true

require_relative '../lib/library'

class Analyst
  def neighbors_of_a_piece(origin)
    legal_moves_of_a_piece(origin).map(&:target)
  end
end

describe Analyst do
  subject(:analyst) { described_class.new(game) }

  describe '#king_in_check_after_move?' do
    let(:game) { Game.new(board:) }

    context 'when white rook is blocking black rook from checking white king' do
      let(:board) { Board.for('k5qr/8/2n4R/p1P5/P7/8/8/7K') }

      it 'king is in-check if rook moves horizontal' do
        result = analyst.king_in_check_after_move?(Move.new(origin: Cell.for('H6'), target: Cell.for('G6')))

        expect(result).to be true
      end

      it 'king is not in-check if rook moves vertical' do
        result = analyst.king_in_check_after_move?(Move.new(origin: Cell.for('H6'), target: Cell.for('H7')))

        expect(result).to be false
      end
    end
  end

  describe '#neighbors_of_a_piece' do
    let(:game) { Game.new(board:) }

    context 'given C51 Evans Gambit board' do
      let(:board) { Board.for('r1bqk1nr/pppp1ppp/2n5/2b1p3/1PB1P3/5N2/P1PP1PPP/RNBQK2R') }

      it 'returns all neighbors from C5' do
        expected = [
          Cell.for('F2'),
          Cell.for('E3'),
          Cell.for('D4'),
          Cell.for('F8'),
          Cell.for('E7'),
          Cell.for('D6'),
          Cell.for('B6'),
          Cell.for('B4')
        ]
        result = analyst.neighbors_of_a_piece(Cell.for('C5'))
        expect(result).to match_array expected
      end
    end

    context 'when white rook is blocking black rook from checking white king' do
      let(:board) { Board.for('k5qr/8/2n4R/p1P5/P7/8/8/7K') }

      it 'white rook can only move vertically' do
        expected = [
          Cell.for('H2'),
          Cell.for('H3'),
          Cell.for('H4'),
          Cell.for('H5'),
          Cell.for('H7'),
          Cell.for('H8')
        ]
        result = analyst.neighbors_of_a_piece(Cell.for('H6'))
        expect(result).to match_array expected
      end
    end
  end

  # describe '#theoretical_moves_of_a_player' do
  #   let(:game) { Game.new(board:) }

  #   context 'given a simple board with white only has only king and bishop' do
  #     let(:board) { Board.for('K7/8/8/8/3p4/8/5B2/7k') }

  #     it 'should return all theoretical moves by white player' do
  #       expected = [
  #         Cell.for('D4'),
  #         Cell.for('E3'),
  #         Cell.for('E1'),
  #         Cell.for('G3'),
  #         Cell.for('G1'),
  #         Cell.for('H4'),
  #         Cell.for('A7'),
  #         Cell.for('B8'),
  #         Cell.for('B7')
  #       ]

  #       result = analyst.theoretical_moves_of_a_player(Color::WHITE)
  #       expect(result).to match_array expected
  #     end
  #   end
  # end

  describe '#king_in_check?' do
    let(:game) { Game.new(board:) }

    context 'when black king can be taken by white rook' do
      let(:board) { Board.for('4k3/8/8/8/4R3/8/8/4K3') }

      it 'black king is in check' do
        result = analyst.king_in_check?(Color::BLACK)

        expect(result).to be true
      end
    end
  end

  describe '#position_attackable_by_player?' do
    let(:game) { Game.new(board:) }

    context 'when a postion is attackable by a piece of a player' do
      let(:board) { Board.for('k7/8/3n4/8/8/8/8/K7') }

      it 'returns true' do
        result = analyst.position_attackable_by_player?(position: Cell.for('E4'), color: Color::BLACK)
        expect(result).to be true
      end
    end
  end

  describe '#checkmated?' do
    let(:game) { Game.new(board:, color:) }

    context "when current player's king is in check and the player can't make any move" do
      let(:board) { Board.for('2k4R/5R2/8/8/8/2K5/7p/8') }
      let(:color) { Color::BLACK }

      it 'he is checkmated' do
        result = analyst.checkmated?
        expect(result).to be true
      end
    end

    context "when current player's king is in check but the player can make a move" do
      let(:board) { Board.for('2k4R/8/5R2/8/8/2K5/7p/8') }
      let(:color) { Color::BLACK }

      it 'he is not checkmated' do
        result = analyst.checkmated?
        expect(result).to be false
      end
    end
  end

  describe '#stalemated?' do
    let(:game) { Game.new(board:, color:) }

    context 'when Black has legal moves and his king is not in check' do
      let(:board) { Board.for('8/1R6/8/8/p3P1K1/k4r2/3R4/8') }
      let(:color) { Color::BLACK }

      it 'he is not stalemated' do
        result = analyst.stalemated?
        expect(result).to be false
      end
    end

    context 'when Black has no legal moves and his king is not in check' do
      let(:board) { Board.for('8/1R6/8/8/p3P3/k4K2/3R4/8') }
      let(:color) { Color::BLACK }

      it 'he is stalemated' do
        result = analyst.stalemated?
        expect(result).to be true
      end
    end
  end
end
