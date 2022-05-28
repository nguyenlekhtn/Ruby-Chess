# frozen_string_literal: true

class BlackPawn < Piece
  def initialize(board)
    super('pawn', 'black', board)
  end

  def to_s
    '♟'
  end
end
