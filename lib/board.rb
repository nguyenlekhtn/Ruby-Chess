class Board
  attr_reader :board

  def initialize(board = BoardBuilder.new.whole('rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR'))
    @board = board
  end

  def get_piece_at(cell)
    row, col = cell.position
    board[row][col]
  end

  def set_piece_at(cell, piece)
    row, col = cell.position
    board[row][col] = piece
  end

  def clear_piece_at(cell)
    row, col = cell.position
    board[row][col] = Piece.for('')
  end

  def empty_at?(cell)
    get_piece_at(cell).name == ''
  end

  def to_s
    board.reverse.map do |row|
      row.map { |piece| piece.to_s }.join(" | ")
    end.join("\n")
  end

  def self.default_board
    [
      'RNBQKBNR'.chars.map { |it| Piece.for(it) },
      'PPPPPPPP'.chars.map { |it| Piece.for(it) },
      Array.new(8) { |it| Piece.for('') },
      Array.new(8) { |it| Piece.for('') },
      Array.new(8) { |it| Piece.for('') },
      Array.new(8) { |it| Piece.for('') },
      'pppppppp'.chars.map { |it| Piece.for(it) },
      'rnbqkbnr'.chars.map { |it| Piece.for(it) },
    ]
  end
    
end
