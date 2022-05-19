# frozen_string_literal: true

class Bishop < Piece
  def initialize(color)
    super('bishop', color)
  end

  def to_s
    if color == 'black'
      '♝'
    else
      '♗'
    end
  end
end
