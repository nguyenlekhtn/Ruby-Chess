# frozen_string_literal: true

class BlackPawn < Piece
  def initialize(board)
    super('pawn', Color::BLACK, board)
  end

  def symbol
    '♟'
  end

  # def to_s
  #   '♟'
  # end

  def validators_class
    [BlackPawnCaptureMoveValidator, BlackPawnPeaceMoveValidator]
  end
end
