class BlackPawnCaptureMoveValidator < Validator
  def valid?(start_pos, end_pos)
    return false unless board.opposite_color_between_2_cells?(start_pos, end_pos)
    return true if reachable_cells(start_pos).include?(end_pos)

    false
  end

  def reachable_cells(pos)
    [pos.jump(row_step: -1, col_step: -1), pos.jump(row_step: -1, col_step: 1)].compact
  end
end
