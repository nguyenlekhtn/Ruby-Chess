# frozen_string_literal: true

class BlankPiece < Piece
  def initialize(board)
    super('', Color::BLANK, board)
  end

  def to_s
    ' '
  end

  def validators_class
    []
  end
end
