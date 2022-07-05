# frozen_string_literal: true

class Rook < Piece
  def initialize(color)
    super('rook', color)
  end

  def symbol
    if color == Color::BLACK
      '♜'
    else
      '♖'
    end
  end

  # def to_s
  #   if color == Color::BLACK
  #     '♜'
  #   else
  #     '♖'
  #   end
  # end

  def validators_class
    [HorizontalValidator, VerticalValidator]
  end

  def neighbor_generator
    ComposedGenerator.new(HorizontalLineGenerator.new(board:), VerticalLineGenerator.new(board:))
  end
end
