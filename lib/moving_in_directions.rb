module MovingInDirection
  def cells_from_moving_in_one_direction(origin:, row_step:, col_step:)
    cells = []
    cursor = origin.jump(row_step:, col_step:)
    while cursor
      cells << cursor
      cursor = cursor.jump(row_step:, col_step:)
    end
    cells
  end
end