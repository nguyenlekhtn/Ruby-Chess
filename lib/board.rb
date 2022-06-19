# frozen_string_literal: true

class Board
  def self.for(notation = 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR', builder = BoardBuilder.new)
    new(builder.build(notation))
  end

  attr_reader :board, :display

  # def initialize(board = default_builder.whole('rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR'))
  #   @board = board
  # end

  def initialize(board)
    @board = board
    @piece_class = Piece
    @display = BoardDisplay.new(self)
  end

  def default_builder
    BoardBuilder.new
  end

  def get_piece_at(cell)
    row, col = cell.position
    board[row][col]
  end

  def get_color_at(cell)
    get_piece_at(cell).color
  end

  def get_piece_name_at(cell)
    get_piece_at(cell).name
  end

  def set_piece_at(cell, piece)
    row, col = cell.position
    board[row][col] = piece
  end

  def clear_piece_at(cell)
    row, col = cell.position
    board[row][col] = piece_class.for('')
  end

  def empty_at?(cell)
    get_piece_at(cell).name == ''
  end

  # def indexToRowNotation(index)
  #   [*('A'..'H')][index] || ''
  # end

  def to_s
    display.box
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

  def get_king_position(color)
    throw 'Invalid Color' unless [Color::BLACK, Color::WHITE].include? color
    all_cells.find do |cell|
      get_color_at(cell) == color && get_piece_name_at(cell) == 'king'
    end
  end

  private

  attr_reader :piece_class
end
