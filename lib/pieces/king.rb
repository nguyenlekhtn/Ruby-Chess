# frozen_string_literal: true

class King < Piece
  def initialize(color, board)
    super('king', color, board)
  end

  def to_s
    if color == Color::BLACK
      '♚'
    else
      '♔'
    end
  end

  def validators_class
    [KingMoveValidator]
  end
end
