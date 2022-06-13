# frozen_string_literal: true

class Bishop < Piece
  def initialize(color, board)
    super('bishop', color, board)
  end

  def symbol
    '♝'
  end

  def validators_class
    [DiagonalValidator]
  end
end
