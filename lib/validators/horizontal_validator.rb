class HorizontalValidator < Validator
  def valid?(start_pos, end_pos)
    return false unless start_pos.same_horizontal_line_with_cell?(end_pos)
    return true if board.no_piece_in_horizontal_line_between_2_cells?(start_pos, end_pos)

    false
  end
end