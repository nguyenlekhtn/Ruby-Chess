class BlackPawnPeaceMoveGenerator < Generator

  def cells(origin)
    neighbors(origin).filter { |neighbor| valid?(origin, neighbor) }
  end

  def neighbors(pos)
    [pos.jump(row_step: -1, col_step: 0), pos.jump(row_step: -2, col_step: 0)].compact
  end

  def inital_row
    6
  end

  def valid?(start_pos, end_pos)
    return false unless board.empty_at?(end_pos)

    return false if start_pos.row != inital_row && (start_pos.row - end_pos.row).abs > 1

    return false unless board.no_piece_in_vertical_line_between_2_cells?(start_pos, end_pos)

    true
  end
end
