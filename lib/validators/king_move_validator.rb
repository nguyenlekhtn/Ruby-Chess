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

  def initialize(board)
    super
    @king_class = King
  end


  def valid?(start_pos, end_pos)
    return false unless reacheable_cells(start_pos).include?(end_pos)
    return true unless any_opposite_piece_can_reach_end_pos?(start_pos, end_pos)

    false
  end

  def any_opposite_piece_can_reach_end_pos?(king_pos, end_pos)
    king_color = board.get_color_at(king_pos)
    opposite_color = king_color.opposite

    opposite_cells = board.get_all_cells_have_color(opposite_color)
    opposite_cells.any? do |opposite_cell|
      valid_move?(opposite_cell, end_pos)
    end
    # any opposite cells can reach any king's neibours?
  end

  def valid_move?(start_pos, end_pos)
    piece = board.get_piece_at(start_pos)
    piece.move_valid?(start_pos, end_pos)
  end

  def reacheable_cells(pos)
    POSSIBLE_PAIRS.map do |(row_step, col_step)|
      pos.jump(row_step: row_step, col_step: col_step)
    end.compact
  end
end
