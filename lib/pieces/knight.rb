# frozen_string_literal: true

class Knight < Piece
  def initialize(color)
    super('knight', color)
  end

  def symbol
    if color == Color::BLACK
      '♞'
    else
      '♘'
    end
  end

  def type_notation
    'N'
  end

  def neighbor_generator(game)
    KnightMoveGenerator.new(game)
  end
end
