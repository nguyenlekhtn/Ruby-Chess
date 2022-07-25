require_relative '../moving_in_directions'

class LineGenerator < Generator
  def cells(origin)
    cells_in_line(origin)
  end

  def cells_in_line(origin)
    directions.map { |(row_step, col_step)| cells_from_moving_in_one_direction(origin:, row_step:, col_step:) }.flatten
  end

  def directions
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def no_piece_between_2_cells?(start_pos, end_pos)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def cells_from_moving_in_one_direction(origin:, row_step:, col_step:)
    cells = []
    current = origin.jump(row_step:, col_step:)
    while current
      if no_piece_between_2_cells?(origin, current)
        cells << current
      else
        break
      end
      current = current.jump(row_step:, col_step:)
    end
    cells
  end
end
