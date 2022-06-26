require_relative '../moving_in_directions.rb'

class HorizontalLineGenerator
  include MovingInDirection

  def cells(cell)
    directions = [[0, 1], [0, -1]]
    directions.map { |(row_step, col_step)| cells_from_moving_in_one_direction(origin: cell, row_step:, col_step:)}.flatten
  end
end