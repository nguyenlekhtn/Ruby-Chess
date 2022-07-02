require_relative '../moving_in_directions.rb'

class DiagonalLineGenerator
  include MovingInDirection

  def cells(origin)
    directions = [[1, 1], [1, -1], [-1, 1], [-1, -1]]
    directions.map { |(row_step, col_step)| cells_from_moving_in_one_direction(origin:, row_step:, col_step:)}.flatten
  end
end