# frozen_string_literal: true

class WhitePawn < Piece
  def initialize
    super('pawn', Color::WHITE)
  end

  def symbol
    '♙'
  end

  # def to_s
  #   '♙'
  # end

  def validators_class
    [WhitePawnCaptureMoveValidator, WhitePawnPeaceMoveValidator]
  end

  def neighbor_generator(ops)
    ops => { board: }
    ComposedGenerator.new([WhitePawnCaptureMoveGenerator.new(board:), WhitePawnPeaceMoveGenerator.new(board:)])
  end
end
