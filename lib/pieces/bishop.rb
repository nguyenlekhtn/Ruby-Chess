# frozen_string_literal: true

class Bishop < Piece
  def initialize(color)
    super('bishop', color)
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

  def possible_neighbors
    pairs = [
      [0,1],
      [0,-1],
      [-1,0],
      [1,0],
      [-1,-1],
      [-1,1],
      [1,-1],
      [1,1]
    ].freeze

    pairs.map do |(row_step, col_step)|
      pos.jump(row_step: row_step, col_step: col_step)
    end.compact
  end

  def neighbor_generator(game)
    DiagonalLineGenerator.new(game)
  end
end
