# frozen_string_literal: true

class BlankPiece < Piece
  def initialize
    super('', Color::BLANK)
  end

  def symbol
    'P'
  end

  def to_s
    symbol
  end

  def validators_class
    []
  end

  def neighbor_generator(_game)
    BlankGenerator.new
  end
end
