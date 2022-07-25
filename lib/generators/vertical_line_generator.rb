require_relative '../moving_in_directions'

class VerticalLineGenerator < LineGenerator
  def directions
    [[-1, 0], [1, 0]]
  end

  def no_piece_between_2_cells?(start_pos, end_pos)
    board.no_piece_in_vertical_line_between_2_cells?(start_pos, end_pos)
  end
end
