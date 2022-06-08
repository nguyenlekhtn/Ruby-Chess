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

  def get_color_at(cell)
    get_piece_at(cell).color
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
    top_bottom_notation = ('A'..'H').to_a.join('   ')
    top_bottom_border = "  #{top_bottom_notation}"
    between_top_bottom = board.reverse.map.with_index do |row, index|
      side_notation = (8 - index).to_s
      cells_inside = row.map(&:to_s).join(' | ')
      "#{side_notation} #{cells_inside} #{side_notation}"
    end.join("\n")
    "#{top_bottom_border}\n#{between_top_bottom}\n#{top_bottom_border}"
  end

  def same_color_between_two_positions?(cell_one, cell_two)
    get_piece_at(cell_one).color == get_piece_at(cell_two).color
  end

  def opposite_color_between_2_cells?(cell_one, cell_two)
    (get_piece_at(cell_one).color == Color::BLACK && get_piece_at(cell_two).color == Color::WHITE) ||
      (get_piece_at(cell_one).color == Color::WHITE && get_piece_at(cell_two).color == Color::BLACK)
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

  def get_all_cells_have_color(color)
    all_cells.filter { |cell| get_color_at(cell) == color }
  end

  def all_cells
    board.map.with_index do |row, row_index|
      row.map.with_index do |_item, col_index|
        Cell.new(row_index, col_index)
      end
    end.flatten
  end
end
