# frozen_string_literal: true

class King < Piece
  def initialize(color, board)
    super('king', color, board)
  end

  def to_s
    if color == 'black'
      '♚'
    else
      '♔'
    end
  end
end
