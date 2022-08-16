class KingsideCastlingGenerator < CastlingGenerator
  def king_jump_step
    2
  end

  def positions_betwen_king_and_rook
    (default_king_column + 1).upto(default_rook_column  - 1).map { |col| Cell.new(default_king_row, col)}
  end

  def default_rook_column
    7
  end

  def rook_new_position
    neighbor.jump_horizontal(-1)
  end
end