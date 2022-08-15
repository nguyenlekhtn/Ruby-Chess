# frozen_string_literal: true

class BlackPawn < Piece
  def initialize
    super('pawn', Color::BLACK)
  end

  def symbol
    '♟'
  end

  def type_notation
    'B'
  end

  def neighbor_generator(game)
    ComposedGenerator.new([BlackPawnCaptureMoveGenerator.new(game), BlackPawnPeaceMoveGenerator.new(game)])
  end
end
