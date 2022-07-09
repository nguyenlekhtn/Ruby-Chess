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

  def neighbor_generator(board)
    KnightMoveGenerator.new(board:)
  end
end
