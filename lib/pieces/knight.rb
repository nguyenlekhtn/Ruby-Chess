# frozen_string_literal: true

class Knight < Piece
  def initialize(color, board)
    super('knight', color, board)
  end

  def symbol
    if color == Color::BLACK
      '♞'
    else
      '♘'
    end
  end

  # def to_s
  #   if color == Color::BLACK
  #     '♞'
  #   else
  #     '♘'
  #   end
  # end

  def validators_class
    [KnightMoveValidator]
  end
end
