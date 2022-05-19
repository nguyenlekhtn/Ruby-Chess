# frozen_string_literal: true

class BlankPiece < Piece
  def initialize
    super('', '')
  end

  def to_s
    ' '
  end
end
