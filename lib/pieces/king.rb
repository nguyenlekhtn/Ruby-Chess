# frozen_string_literal: true

class King < Piece
  def initialize(color)
    super('king', color)
  end

  def symbol
    if color == Color::BLACK
      '♚'
    else
      '♔'
    end
  end

  # def to_s
  #   if color == Color::BLACK
  #     '♚'
  #   else
  #     '♔'
  #   end
  # end

  def validators_class
    [KingMoveValidator]
  end

  def possible_neighbors(pos)
    pairs = [
      [0, 1],
      [0, -1],
      [-1, 0],
      [1, 0],
      [-1, -1],
      [-1, 1],
      [1, -1],
      [1, 1]
    ].freeze

    pairs.map do |(row_step, col_step)|
      pos.jump(row_step:, col_step:)
    end.compact
  end

  def neighbor_generator(game)
    KingMoveGenerator.new(game)
  end

  def theoretical_neighbors(game:, origin:)
    possible_neighbors(origin)
  end
end
