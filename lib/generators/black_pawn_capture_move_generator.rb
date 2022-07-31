class BlackPawnCaptureMoveGenerator < Generator
  include NormalMove

  def cells(origin)
    neighbors(origin).filter { |neighbor| valid?(origin, neighbor) }
  end

  def neighbors(pos)
    [pos.jump(row_step: -1, col_step: -1), pos.jump(row_step: -1, col_step: 1)].compact
  end

  def valid?(start_pos, end_pos)
    return false unless board.opposite_color_between_2_cells?(start_pos, end_pos)

    true
  end
end
