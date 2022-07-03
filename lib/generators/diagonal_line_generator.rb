require_relative '../moving_in_directions.rb'

class DiagonalLineGenerator < LineGenerator
  def directions
    [[1, 1], [1, -1], [-1, 1], [-1, -1]]
  end

  def no_piece_between_2_cells?(start_pos, end_pos)
    board.no_piece_in_diagonal_line_between_2_cells?(start_pos, end_pos)
  end
end