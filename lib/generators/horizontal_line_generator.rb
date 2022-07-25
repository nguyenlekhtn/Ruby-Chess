require_relative '../moving_in_directions'

class HorizontalLineGenerator < LineGenerator
  def directions
    [[0, -1], [0, 1]]
  end

  def no_piece_between_2_cells?(start_pos, end_pos)
    board.no_piece_in_horizontal_line_between_2_cells?(start_pos, end_pos)
  end
end
