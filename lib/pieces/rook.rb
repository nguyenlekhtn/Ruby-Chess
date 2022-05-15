class Rook < Piece
  def initialize(color)
    super('rook', color)
  end

  def to_s
    if color == 'black'
      '♜'
    else
      '♖'
    end
  end
end
