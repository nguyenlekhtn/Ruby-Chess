class KingMoveGenerator < Generator
  include NormalMove

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
end
