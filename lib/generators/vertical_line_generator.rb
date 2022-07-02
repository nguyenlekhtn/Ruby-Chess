require_relative '../moving_in_directions.rb'

class VerticalLineGenerator
  include MovingInDirection

  def cells(origin)
    directions = [[1, 0], [-1, 0]]
    directions.map { |(row_step, col_step)| cells_from_moving_in_one_direction(origin:, row_step:, col_step:)}.flatten
  end
end