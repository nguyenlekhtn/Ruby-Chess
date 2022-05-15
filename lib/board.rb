class Board
  attr_reader :board

  def initialize(notation = 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR')
    @board = BoardBuilder.new.whole(notation)
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
end
