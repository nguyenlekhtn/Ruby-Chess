# frozen_string_literal: true

class Board
  def self.default_board
    [
      'RNBQKBNR'.chars.map { |it| Piece.for(it) },
      'PPPPPPPP'.chars.map { |it| Piece.for(it) },
      Array.new(8) { |_it| Piece.for('', board) },
      Array.new(8) { |_it| Piece.for('', board) },
      Array.new(8) { |_it| Piece.for('', board) },
      Array.new(8) { |_it| Piece.for('', board) },
      'pppppppp'.chars.map { |it| Piece.for(it) },
      'rnbqkbnr'.chars.map { |it| Piece.for(it) }
    ]
  end

  def self.for(notation)
    new(notation: notation)
  end

  attr_reader :board

  # def initialize(board = default_builder.whole('rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR'))
  #   @board = board
  # end

  def initialize(builder: default_builder, notation: 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR')
    @board = builder.whole(notation)
  end

  def default_builder
    BoardBuilder.new(self)
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
    board[row][col] = Piece.for('', board)
  end

  def empty_at?(cell)
    get_piece_at(cell).name == ''
  end

  # def indexToRowNotation(index)
  #   [*('A'..'H')][index] || ''
  # end

  def to_s
    board.reverse.map.with_index do |row, index|
      (8 - index).to_s + row.map(&:to_s).join(' | ')
    end.join("\n") + + "\n" + ' ' + ('A'..'H').to_a.join('   ')
  end

  def same_color_between_two_positions?(cell_one, cell_two)
    get_piece_at(cell_one).color == get_piece_at(cell_two).color
  end

  def opposite_color_between_2_cells?(cell_one, cell_two)
    (get_piece_at(cell_one).color == 'black' && get_piece_at(cell_two).color == 'white') ||
      (get_piece_at(cell_one).color == 'white' && get_piece_at(cell_two).color == 'black')
  end

  def no_piece_in_horizontal_line_between_2_cells?(cell1, cell2)
    cells_in_between = cell1.cells_in_between_horizontal_line_from_cell(cell2)
    all_empty?(cells_in_between)
  end

  def no_piece_in_vertical_line_between_2_cells?(cell1, cell2)
    cells_in_between = cell1.cells_in_between_vertical_line_from_cell(cell2)
    all_empty?(cells_in_between)
  end

  def no_piece_in_diagonal_line_between_2_cells?(cell1, cell2)
    cells_in_between = cell1.cells_in_between_diagonal_line_from_cell(cell2)
    p cells_in_between
    all_empty?(cells_in_between)
  end

  def all_empty?(cells)
    cells.all? { |cell| empty_at?(cell) }
  end

  def same_color_at_cell?(cell, color)
    get_piece_at(cell).color == color
  end
end
