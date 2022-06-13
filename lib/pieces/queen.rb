# frozen_string_literal: true

class Queen < Piece
  def initialize(color, board)
    super('queen', color, board)
  end

  def symbol
    '♛'
  end

  def validators_class
    [VerticalValidator, HorizontalValidator, DiagonalValidator]
  end
end
