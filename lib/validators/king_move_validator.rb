class KingMoveValidator < Validator
  POSSIBLE_PAIRS = [
    [0,1],
    [0,-1],
    [-1,0],
    [1,0],
    [-1,-1],
    [-1,1],
    [1,-1],
    [1,1]
  ].freeze

  def valid?(start_pos, end_pos)
    return false unless reacheable_cells(start_pos).include?(end_pos)
    
    return true if any_opposite_piece_can_reach_king_neighbours?(start_pos)
    
  end

  def any_opposite_piece_can_reach_king_neighbours?(king_pos)
    king_color = board.get_color_at(king_pos)
    opposite_color = opposite_color(king_color)

    opposite_cells = board.get_all_cells_have_color(opposite_color)
    opposite_cells.any? do |opposite_cell|
      reacheable_cells.any? do |neighbour|
        validator.valid?(opposite_cell, neighbour)
      end
    end
    # any opposite cells can reach any king's neibours?
  end

  def reacheable_cells(pos)
    POSSIBLE_PAIRS.map do |(row_step, col_step)|
      pos.jump(row_step: row_step, col_step: col_step)
    end.compact
  end
end
