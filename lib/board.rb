class Board
  attr_reader :board

  def initialize(board = BoardBuilder.new.whole('rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR'))
    @board = board
  end

  def get(cell)
    row, col = cell.position
    board[row][col]
  end

  def set(cell, piece)
    row, col = cell.position
    board[row][col] = piece
  end

  def delete(cell)
    row, col = cell.position
    board[row][col] = Piece.new
  end

  def self.default_board
    [
      'rnbqkbnr'.chars.map { |it| Piece.for(it) },
      'pppppppp'.chars.map { |it| Piece.for(it) },
      Array.new(8) { |it| Piece.for('') },
      Array.new(8) { |it| Piece.for('') },
      Array.new(8) { |it| Piece.for('') },
      Array.new(8) { |it| Piece.for('') },
      'PPPPPPPP'.chars.map { |it| Piece.for(it) },
      'RNBQKBNR'.chars.map { |it| Piece.for(it) },
    ]
  end
    
end
