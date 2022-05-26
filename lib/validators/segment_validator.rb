class SegmentValidator < Validator
  def valid?(start_pos, end_pos)
    return false unless same_line?(start_pos, end_pos)
    return true if no_piece_between_2_cells?(start_pos, end_pos)

    false
  end

  def same_line?(start_pos, end_pos)
    raise NotImplementedError
  end

  def no_piece_between_2_cells?(start_pos, end_pos)
    raise NotImplementedError
  end

end