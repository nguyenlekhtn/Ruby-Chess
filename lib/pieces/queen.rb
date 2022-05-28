# frozen_string_literal: true

class Queen < Piece
  def initialize(color, board)
    super('queen', color, board)
  end

  def to_s
    if color == 'black'
      '♛'
    else
      '♕'
    end
  end
end
