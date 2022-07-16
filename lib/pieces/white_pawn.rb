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

  def neighbor_generator(game)
    ComposedGenerator.new([WhitePawnCaptureMoveGenerator.new(game), WhitePawnPeaceMoveGenerator.new(game)])
  end
end
