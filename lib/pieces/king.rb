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

  def type_notation
    'K'
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
    castling_moves = if color == Color::BLACK
      [KingsideCastlingGenerator.new(game, WhiteSide.new), QueensideCastlingGenerator.new(game, WhiteSide.new)]
    else
      [KingsideCastlingGenerator.new(game, BlackSide.new), QueensideCastlingGenerator.new(game, BlackSide.new)]
    end
    ComposedGenerator.new([KingMoveGenerator.new(game), *castling_moves])
  end
end
