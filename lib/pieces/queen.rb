# frozen_string_literal: true

class Queen < Piece
  def initialize(color)
    super('queen', color)
  end

  def symbol
    if color == Color::BLACK
      '♛'
    else
      '♕'
    end
  end

  def type_notation
    'Q'
  end

  def neighbor_generator(game)
    ComposedGenerator.new([VerticalLineGenerator.new(game), HorizontalLineGenerator.new(game),
                           DiagonalLineGenerator.new(game)])
  end
end
