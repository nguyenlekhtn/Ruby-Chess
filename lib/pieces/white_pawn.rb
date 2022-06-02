# frozen_string_literal: true

class WhitePawn < Piece
  def initialize(board)
    super('pawn', 'white', board)
  end

  def to_s
    '♙'
  end

  def validators_class
    [WhitePawnCaptureMoveValidator, WhitePawnPeaceMoveValidator]
  end
end
