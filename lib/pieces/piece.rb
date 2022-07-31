# frozen_string_literal: true

class Piece
  def self.for(notation)
    Hash.new(BlankPiece.new).merge(
      'r' => Rook.new(Color::BLACK),
      'b' => Bishop.new(Color::BLACK),
      'n' => Knight.new(Color::BLACK),
      'q' => Queen.new(Color::BLACK),
      'k' => King.new(Color::BLACK),
      'p' => BlackPawn.new,
      'R' => Rook.new(Color::WHITE),
      'B' => Bishop.new(Color::WHITE),
      'N' => Knight.new(Color::WHITE),
      'Q' => Queen.new(Color::WHITE),
      'K' => King.new(Color::WHITE),
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

  def validators_class
    throw NotImplementedError
  end

  def to_s
    case color
    when Color::BLACK
      symbol.black
    when Color::WHITE
      symbol.white
    else
      symbol
    end.on_light_cyan
  end

  def neighbor_generator(_game)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def neighbors(game:, origin:)
    neighbor_generator(game).cells(origin)
  end
end
