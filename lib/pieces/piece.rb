# frozen_string_literal: true

class Piece
  def self.for(notation, board)
    Hash.new(BlankPiece.new(board)).merge(
      'r' => Rook.new(Color::BLACK, board),
      'b' => Bishop.new(Color::BLACK, board),
      'n' => Knight.new(Color::BLACK, board),
      'q' => Queen.new(Color::BLACK, board),
      'k' => King.new(Color::BLACK, board),
      'p' => BlackPawn.new(board),
      'R' => Rook.new(Color::WHITE, board),
      'B' => Bishop.new(Color::WHITE, board),
      'N' => Knight.new(Color::WHITE, board),
      'Q' => Queen.new(Color::WHITE, board),
      'K' => King.new(Color::WHITE, board),
      'P' => WhitePawn.new(board)
    )[notation]
  end

  attr_reader :name, :color, :board

  def initialize(name, color, board)
    @name = name
    @color = color
    @board = board
  end

  def ==(other)
    other.class == self.class && other.name == @name && other.color == @color
  end

  def to_s
    throw 'Need to implement this'
  end

  def validators_class
    throw NotImplementedError
  end

  def validators
    validators_class.map { |it| it.new(board) }
  end
end
