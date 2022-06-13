# frozen_string_literal: true

class Knight < Piece
  def initialize(color, board)
    super('knight', color, board)
  end

  def symbol
    '♞'
  end

  def validators_class
    [KnightMoveValidator]
  end
end
