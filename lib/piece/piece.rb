class Piece
  attr_reader :name, :color

  def initialize(name = nil, color = nil)
    @name = name
    @color = color
  end

  def ==(other)
    other.name == @name && other.color == @color
  end

  def to_s
    ' '
  end
end
