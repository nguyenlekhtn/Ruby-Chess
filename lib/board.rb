# frozen_string_literal: true

class Board
  def self.for(notation = 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR', builder = BoardBuilder.new)
    new(builder.build(notation))
  end

  attr_reader :grid, :display

  # def initialize(board = default_builder.whole('rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR'))
  #   @board = board
  # end

  def initialize(grid)
    @grid = grid
    @piece_class = Piece
    @display = BoardDisplay.new(self)
  end

  def board
    grid
  end

  def eql?(other)
    other.class == self.class && other.grid == @grid
  end

  alias == eql?

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
    grid[row][col] = piece
  end

  def board_after_clear_piece_at(cell)
    board_after_set_piece_at(cell, piece_class.for(''))
  end

  def board_after_set_piece_at(cell, piece)
    row, col = cell.position
    new_grid = Marshal.load(Marshal.dump(grid))
    new_grid[row][col] = piece
    Board.new(new_grid)
  end

  def clear_piece_at(cell)
    row, col = cell.position
    grid[row][col] = piece_class.for('')
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

  def all_cells_have_color(color)
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

  def to_notation
    grid.map { |grid_row| row_to_notation_string(grid_row) }.reverse.join('/')
  end

  def row_to_notation_arr(grid_row)
    grid_row.each_with_object([]) do |piece, notation_arr|
      notation = piece.notation
      if notation == ''
        if notation_arr.last.is_a? Numeric
          notation_arr[notation_arr.length - 1] += 1
        else
          notation_arr.push(1)
        end
      else
        notation_arr.push(notation)
      end
    end
  end

  def row_to_notation_string(grid_row)
    row_to_notation_arr(grid_row).join
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'notation' => to_notation
    }.to_json(*args)
  end

  def self.json_create(object)
    Board.for(object['notation'])
  end

  private

  attr_reader :piece_class
end
