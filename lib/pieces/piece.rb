# frozen_string_literal: true

class Piece
  def self.for(notation, board)
    Hash.new(BlankPiece.new(board)).merge(
      'r' => Rook.new('black', board),
      'b' => Bishop.new('black', board),
      'n' => Knight.new('black', board),
      'q' => Queen.new('black', board),
      'k' => King.new('black', board),
      'p' => BlackPawn.new(board),
      'R' => Rook.new('white', board),
      'B' => Bishop.new('white', board),
      'N' => Knight.new('white', board),
      'Q' => Queen.new('white', board),
      'K' => King.new('white', board),
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
    other.class == self.class && other.name == @name && other.color == @color && other.board == @board
  end

  def to_s
    throw 'Need to implement this'
  end
end
