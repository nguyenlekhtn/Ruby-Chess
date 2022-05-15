class BlankPiece < Piece
  def initialize
    super(nil, nil)
  end

  def to_s
    ' '
  end
end
