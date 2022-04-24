require_relative 'piece'

class WhitePawn < Piece
  def initialize
    super('pawn', :white)
  end

  def to_s
    '♙'
  end
end
