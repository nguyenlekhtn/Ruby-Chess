class Knight < Piece
  def initialize(color)
    super('knight', color)
  end

  def to_s
    if color == 'black'
      '♞'
    else
      '♘'
    end
  end
end
