class KnightMoveGenerator
  include NormalMove

  def cells(origin)
    neighbors(origin)
  end

  def neighbors(origin)
    [
      [1, -2],
      [1, 2],
      [-1, 2],
      [-1, -2],
      [2, 1],
      [2, -1],
      [-2, -1],
      [-2, 1]
    ].map { |row_step, col_step| origin.jump(row_step:, col_step:) }.compact
  end

  def moves(origin)
    cells(origin).map { |cell| { cell:, generator: self } }
  end
end
