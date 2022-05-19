# frozen_string_literal: true

class King < Piece
  def initialize(color)
    super('king', color)
  end

  def to_s
    if color == 'black'
      '♚'
    else
      '♔'
    end
  end
end
