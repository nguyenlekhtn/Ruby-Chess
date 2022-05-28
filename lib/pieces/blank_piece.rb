# frozen_string_literal: true

class BlankPiece < Piece
  def initialize(board)
    super('', '', board)
  end

  def to_s
    ' '
  end
end
