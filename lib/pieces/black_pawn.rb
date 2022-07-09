# frozen_string_literal: true

class BlackPawn < Piece
  def initialize
    super('pawn', Color::BLACK)
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

  def neighbor_generator(board)
    ComposedGenerator.new([BlackPawnCaptureMoveGenerator.new(board:), BlackPawnPeaceMoveGenerator.new(board:)])
  end
end
