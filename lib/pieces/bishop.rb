# frozen_string_literal: true

class Bishop < Piece
  def initialize(color, board)
    super('bishop', color, board)
  end

  def symbol
    if color == Color::BLACK
      '♝'
    else
      '♗'
    end
  end

  # def to_s
  #   if color == Color::BLACK
  #     '♝'
  #   else
  #     '♗'
  #   end
  # end

  def validators_class
    [DiagonalValidator]
  end
end
