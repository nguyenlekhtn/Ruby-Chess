class Piece
  def self.for(notation)
    Hash.new(BlankPiece.new).merge(
      'r' => Rook.new('black'),
      'b' => Bishop.new('black'),
      'n' => Knight.new('black'),
      'q' => Queen.new('black'),
      'k' => King.new('black'),
      'p' => BlackPawn.new,
      'R' => Rook.new('white'),
      'B' => Bishop.new('white'),
      'N' => Knight.new('white'),
      'Q' => Queen.new('white'),
      'K' => King.new('white'),
      'P' => WhitePawn.new
    )[notation]
  end

  attr_reader :name, :color

  def initialize(name, color)
    @name = name
    @color = color
  end

  def ==(other)
    other.class == self.class && other.name == @name && other.color == @color
  end

  def to_s
    throw 'Need to implement this'
  end
end
