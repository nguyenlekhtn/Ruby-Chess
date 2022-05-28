# frozen_string_literal: true

class Bishop < Piece
  def initialize(color, board)
    super('bishop', color, board)
  end

  def to_s
    if color == 'black'
      '♝'
    else
      '♗'
    end
  end
end
