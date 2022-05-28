class HorizontalValidator < SegmentValidator
  def same_line?(start_pos, end_pos)
    start_pos.same_horizontal_line_with_cell?(end_pos)
  end

  def no_piece_between_2_cells?(start_pos, end_pos)
    board.no_piece_in_horizontal_line_between_2_cells?(start_pos, end_pos)
  end
end