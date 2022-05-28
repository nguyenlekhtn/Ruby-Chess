# frozen_string_literal: true

class Rook < Piece
  def initialize(color, board)
    super('rook', color, board)
  end

  def to_s
    if color == 'black'
      '♜'
    else
      '♖'
    end
  end

  def validators_class
    [HorizontalValidator, VerticalValidator]
  end
end
