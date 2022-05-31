class BlackPawnPeaceMoveValidator < Validator
  def valid?(start_pos, end_pos)
    return false unless board.empty_at?(end_pos)
    return false unless reachable_cells(start_pos).include?(end_pos)

    if end_pos == start_pos.jump(row_step: -1, col_step: 0)
      true
    elsif board.no_piece_in_vertical_line_between_2_cells?(start_pos, end_pos)
      true
    else
      false
    end
  end

  def reachable_cells(pos)
    [pos.jump(row_step: -1, col_step: 0), pos.jump(row_step: -2, col_step: 0)]
  end
end
