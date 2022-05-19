# frozen_string_literal: true

class Queen < Piece
  def initialize(color)
    super('queen', color)
  end

  def to_s
    if color == 'black'
      '♛'
    else
      '♕'
    end
  end
end
