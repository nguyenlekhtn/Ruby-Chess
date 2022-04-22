class Piece
  attr_reader :name, :color

  def initialize(name, color)
    @name = name
    @color = @color

  end

  def to_s
    first_char = name[0]
    return if (color == :white) first_char.capitalize else first_char
  end
end