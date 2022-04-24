require_relative 'piece'

class BlackPawn < Piece
  def initialize
    super('pawn', :black)
  end

  def to_s
    '♟'
  end
end
