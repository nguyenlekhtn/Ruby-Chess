class KnightMoveValidator < Validator
  POSSIBLE_PAIRS = [
    [1, 2],
    [1, -2],
    [2, 1],
    [2, -1],
    [-2, -1],
    [-2, 1],
    [-1, -2],
    [-1, 2]
  ].freeze

  def valid?(start_pos, end_pos)
    reacheable_cells(start_pos).include?(end_pos)
  end

  def reacheable_cells(pos)
    POSSIBLE_PAIRS.map do |(row_step, col_step)|
      pos.jump(row_step: row_step, col_step: col_step)
    end.compact
  end
end