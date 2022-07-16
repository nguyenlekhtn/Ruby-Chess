class KingMoveGenerator < Generator
  def cells(origin)
    neighbors(origin)
  end

  def neighbors(origin)
    [
      [0, -1],
      [0, 1],
      [-1, 0],
      [1, 0],
      [-1, -1],
      [-1, 1],
      [1, -1],
      [1, 1]
    ].map { |row_step, col_step| origin.jump(row_step:, col_step:) }.compact
  end

  def be_attackable_by_opposite_player?(pos)

  end
end

