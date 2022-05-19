# frozen_string_literal: true

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

  def indexToRowNotation(index)
    [*('A'..'H')][index] || ''
  end

  def to_s
    board.reverse.map.with_index do |row, index|
      (8 - index).to_s + row.map(&:to_s).join(' | ')
    end.join("\n") + + "\n" + ' ' + ('A'..'H').to_a.join('   ')
  end

  def self.default_board
    [
      'RNBQKBNR'.chars.map { |it| Piece.for(it) },
      'PPPPPPPP'.chars.map { |it| Piece.for(it) },
      Array.new(8) { |_it| Piece.for('') },
      Array.new(8) { |_it| Piece.for('') },
      Array.new(8) { |_it| Piece.for('') },
      Array.new(8) { |_it| Piece.for('') },
      'pppppppp'.chars.map { |it| Piece.for(it) },
      'rnbqkbnr'.chars.map { |it| Piece.for(it) }
    ]
  end
end
