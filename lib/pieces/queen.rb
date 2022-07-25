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

  # def to_s
  #   if color == Color::BLACK
  #     '♛'
  #   else
  #     '♕'
  #   end
  # end

  def validators_class
    [VerticalValidator, HorizontalValidator, DiagonalValidator]
  end

  def neighbor_generator(game)
    ComposedGenerator.new([VerticalLineGenerator.new(game), HorizontalLineGenerator.new(game),
                           VerticalLineGenerator.new(game)])
  end
end
