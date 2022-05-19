# frozen_string_literal: true

class BlackPawn < Piece
  def initialize
    super('pawn', 'black')
  end

  def to_s
    '♟'
  end
end
