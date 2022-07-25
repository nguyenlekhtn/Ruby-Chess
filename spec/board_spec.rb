# frozen_string_literal: true

require_relative '../lib/library'

describe Board do
  describe '#get_piece_at' do
    subject(:board) { described_class.for }

    context 'when the cell has a White Rock there' do
      it 'returns the White Rock' do
        result = board.get_piece_at(Cell.for('A1'))

        expect(result).to eq(Piece.for('R'))
      end
    end

    context 'when the cell has a White Pawn there' do
      it 'returns the White Pawn' do
        result = board.get_piece_at(Cell.for('C2'))

        expect(result).to eq(Piece.for('P'))
      end
    end

    context 'when the cell has no piece there' do
      it 'returns blank piece' do
        cell = Cell.for('D3')
        result = board.get_piece_at(cell)

        expect(result).to eq(Piece.for(''))
      end
    end
  end

  describe '#set_piece_at' do
    subject(:board) { described_class.for }

    context 'when set the piece White Rook at a3' do
      it 'has the white rook at A3' do
        cell = Cell.for('A3')
        white_rook = Piece.for('R')
        board.set_piece_at(cell, white_rook)

        result = board.get_piece_at(cell)
        expect(result).to eq(white_rook)
      end
    end
  end

  describe '#clear_piece_at' do
    subject(:board) { described_class.for }

    context 'when delete the cell a3' do
      it 'the cell contains blank piece after' do
        cell = Cell.for('A3')
        board.clear_piece_at(cell)

        board.clear_piece_at(cell)
        expected = Piece.for('')
        expect(board.get_piece_at(cell)).to eq(expected)
      end
    end
  end

  describe '#empty_at?' do
    subject(:board) { described_class.for }

    context 'when there is a piece at the selected cell' do
      it 'returns false' do
        cell = Cell.for('A8')
        result = board.empty_at?(cell)
        expect(result).to be false
      end
    end

    context 'when there is no piece at the selected cell' do
      it 'returns true' do
        cell = Cell.for('C3')
        result = board.empty_at?(cell)
        expect(result).to be true
      end
    end
  end

  # describe '#indexToRowNotation' do
  #   subject(:board) { described_class.for }
  #   context 'when index is 0' do
  #     it 'returns A' do
  #       result = board.indexToRowNotation(0)
  #       expect(result).to eq 'A'
  #     end
  #   end

  #   context 'when index is 3' do
  #     it 'returns D' do
  #       result = board.indexToRowNotation(3)
  #       expect(result).to eq 'D'
  #     end
  #   end

  #   context 'when index out of range' do
  #     it 'returns ""' do
  #       result = board.indexToRowNotation(9)
  #       expect(result).to eq ''
  #     end
  #   end
  # end

  describe '#same_color_between_two_positions?' do
    subject(:board_color) { described_class.for }
    context 'when two cells have same color' do
      it 'returns true' do
        result = board_color.same_color_between_two_positions?(Cell.for('A1'), Cell.for('B1'))
        expect(result).to be true
      end
    end

    context 'when two cells have different colors' do
      it 'returns false' do
        result = board_color.same_color_between_two_positions?(Cell.for('A1'), Cell.for('A8'))
        expect(result).to be false
      end
    end

    context 'when one has color and the other is empty' do
      it 'returns false' do
        result = board_color.same_color_between_two_positions?(Cell.for('A1'), Cell.for('A3'))
        expect(result).to be false
      end
    end
  end

  describe '#no_piece_in_horizontal_line_between_2_cells?' do
    subject(:board_horizontal) { described_class.for('8/8/8/8/8/1K1Q2B1/8/8') }
    context 'when there are pieces in between' do
      it 'should return false' do
        result = board_horizontal.no_piece_in_horizontal_line_between_2_cells?(Cell.for('B3'), Cell.for('G3'))
        expect(result).to be false
      end
    end

    context 'when there is no piece in between' do
      it 'should return true' do
        result = board_horizontal.no_piece_in_horizontal_line_between_2_cells?(Cell.for('B3'), Cell.for('D3'))
        expect(result).to be true
      end
    end
  end

  describe '#no_piece_in_vertical_line_between_2_cells?' do
    subject(:board_vertical) { described_class.for('8/8/8/8/8/1K1Q2B1/8/8') }
    context 'when there are pieces in between' do
      it 'should return false' do
        result = board_vertical.no_piece_in_vertical_line_between_2_cells?(Cell.for('D1'), Cell.for('D7'))
        expect(result).to be false
      end
    end

    context 'when there is no piece in between' do
      it 'should return true' do
        result = board_vertical.no_piece_in_vertical_line_between_2_cells?(Cell.for('D1'), Cell.for('D3'))
        expect(result).to be true
      end
    end
  end

  describe '#no_piece_in_diagonal_line_between_2_cells?' do
    context 'when there are pieces in between anti diagonal' do
      subject(:board_diagonal) { described_class.for('8/6K1/8/8/3B1Q2/8/1B6/8') }

      it 'should return false' do
        result = board_diagonal.no_piece_in_diagonal_line_between_2_cells?(Cell.for('B2'), Cell.for('G7'))
        expect(result).to be false
      end
    end

    context 'when there are pieces in between diagonal' do
      subject(:board_diagonal) { described_class.for('8/1B6/8/3B4/4Q3/8/6K1/8') }

      it 'should return false' do
        result = board_diagonal.no_piece_in_diagonal_line_between_2_cells?(Cell.for('B7'), Cell.for('G2'))
        expect(result).to be false
      end
    end

    context 'when there is no piece in between' do
      subject(:board_diagonal) { described_class.for('8/6K1/8/8/3B1Q2/8/1B6/8') }

      it 'should return true' do
        result = board_diagonal.no_piece_in_vertical_line_between_2_cells?(Cell.for('D4'), Cell.for('G7'))
        expect(result).to be true
      end
    end
  end

  describe '#opposite_color_between_2_cells?' do
    context 'when one cell has white piece and the other has black piece' do
      subject(:board) { described_class.for('8/8/8/2Q1n3/8/8/8/8') }

      it 'should return true' do
        result = board.opposite_color_between_2_cells?(Cell.for('C5'), Cell.for('E5'))
        expect(result).to be true
      end
    end

    context 'when one cell has black piece and the other has white piece' do
      subject(:board) { described_class.for('8/8/8/5N2/2r5/8/8/8') }

      it 'should return true' do
        result = board.opposite_color_between_2_cells?(Cell.for('C4'), Cell.for('F5'))
        expect(result).to be true
      end
    end

    context 'when one cell has black piece and the other has white piece' do
      subject(:board) { described_class.for('8/8/8/5N2/2r5/8/8/8') }

      it 'should return true' do
        result = board.opposite_color_between_2_cells?(Cell.for('C4'), Cell.for('F5'))
        expect(result).to be true
      end
    end

    context 'when one cell has black piece and the other has black piece' do
      subject(:board) { described_class.for('8/8/8/2q2n2/8/8/8/8') }

      it 'should return false' do
        result = board.opposite_color_between_2_cells?(Cell.for('C5'), Cell.for('F5'))
        expect(result).to be false
      end
    end

    context 'when one cell has black piece and the other has blank piece' do
      subject(:board) { described_class.for('8/8/8/2q2n2/8/8/8/8') }

      it 'should return false' do
        result = board.opposite_color_between_2_cells?(Cell.for('C5'), Cell.for('E5'))
        expect(result).to be false
      end
    end
  end

  describe '#same_color_at_cell?' do
    subject(:board) { described_class.for('8/8/3K4/5n2/8/2N1n3/8/8') }

    context 'when the piece at cell has color white and the comparing color is white' do
      it 'should return true' do
        result = board.same_color_at_cell?(Cell.for('C3'), Color::WHITE)
        expect(result).to be true
      end
    end

    context 'when the piece at cell has color white and the comparing color is black' do
      it 'should return false' do
        result = board.same_color_at_cell?(Cell.for('C3'), Color::BLACK)
        expect(result).to be false
      end
    end

    context 'when the piece at cell has color black and the comparing color is white' do
      it 'should return false' do
        result = board.same_color_at_cell?(Cell.for('E3'), Color::WHITE)
        expect(result).to be false
      end
    end

    context 'when the piece at cell has color black and the comparing color is black' do
      it 'should return true' do
        result = board.same_color_at_cell?(Cell.for('E3'), Color::BLACK)
        expect(result).to be true
      end
    end

    context 'when there is no piece and the comparing color is black' do
      it 'should return false' do
        result = board.same_color_at_cell?(Cell.for('D3'), Color::BLACK)
        expect(result).to be false
      end
    end

    context 'when there is no piece and the comparing color is black' do
      it 'should return false' do
        result = board.same_color_at_cell?(Cell.for('D3'), Color::WHITE)
        expect(result).to be false
      end
    end
  end

  describe '#all_cells_have_color' do
    subject(:board) { described_class.for('8/8/1b6/4B3/8/2Q5/5N2/8') }

    it 'should return all cells have same color' do
      result = board.all_cells_have_color(Color::WHITE)
      expected = [Cell.for('C3'), Cell.for('E5'), Cell.for('F2')]

      expect(result).to match_array(expected)
    end
  end

  describe '#get_king_position' do
    context 'if the king is still alive' do
      subject(:board_king) { described_class.for('8/2k5/8/8/8/8/3K4/8') }

      it 'returns the correct postion if black color is given as argument' do
        result = board_king.get_king_position(Color::BLACK)
        expected = Cell.for('C7')
        expect(result).to eq(expected)
      end

      it 'returns the correct postion if white color is given as argument' do
        result = board_king.get_king_position(Color::WHITE)
        expected = Cell.for('D2')
        expect(result).to eq(expected)
      end
    end

    context 'when the king is died' do
      subject(:board_king) { described_class.for('8/2k5/8/8/8/8/8/8') }

      it 'returns nil' do
        result = board_king.get_king_position(Color::WHITE)
        expect(result).to eq(nil)
      end
    end
  end
end
