# frozen_string_literal: true

class QueensideCastlingGenerator < CastlingGenerator
  def king_jump_step
    -2
  end

  def positions_betwen_king_and_rook
    (default_rook_column + 1).upto(default_king_column - 1).map { |col| Cell.new(default_king_row, col) }
  end

  def default_rook_column
    0
  end

  def rook_new_position
    neighbor.jump_horizontal(1)
  end

  def generate_moves(origin)
    cells(origin).map { |_target| CastlingMove.new(self) }
  end
end
