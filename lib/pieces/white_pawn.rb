# frozen_string_literal: true

class WhitePawn < Piece
  def initialize(board)
    super('pawn', Color::WHITE, board)
  end

  def symbol
    '♙'
  end

  def validators_class
    [WhitePawnCaptureMoveValidator, WhitePawnPeaceMoveValidator]
  end
end
