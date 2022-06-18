# frozen_string_literal: true

class Rook < Piece
  def initialize(color, board)
    super('rook', color, board)
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
end
