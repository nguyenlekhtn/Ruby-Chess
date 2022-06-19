# frozen_string_literal: true

class BlankPiece < Piece
  def initialize
    super('', Color::BLANK)
  end

  def symbol
    ' '
  end

  def to_s
    symbol
  end

  def validators_class
    []
  end
end
