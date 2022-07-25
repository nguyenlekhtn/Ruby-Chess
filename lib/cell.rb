# frozen_string_literal: true

class Cell
  include ReversableRange

  def self.for(notation)
    format = /[A-H][1-8]/i
    return nil unless notation.match(format)

    row, col = notation_to_position(notation)
    new(row, col)
  end

  def self.row_to_notation(row)
    (row + 1).to_s
  end

  def self.col_to_notation(col)
    [*('A'..'H')][col]
  end

  attr_reader :row, :col

  def self.notation_to_position(notation)
    col = notation[0].upcase.ord - 65
    row = notation[1].to_i - 1

    [row, col]
  end

  def initialize(row, col)
    @row = row
    @col = col
  end

  def position
    [row, col]
  end

  def hash
    [row, col].hash
  end

  def eql?(other)
    other.class == self.class && other.row == @row && other.col == @col
  end

  def same_horizontal_line_with_cell?(cell)
    row == cell.row
  end

  def same_vertical_line_with_cell?(cell)
    col == cell.col
  end

  def same_anti_diagonal_line_with_cell?(cell)
    col - cell.col == - (row - cell.row)
  end

  def same_diagonal_line_with_cell?(cell)
    (col - cell.col).abs == (row - cell.row).abs
  end

  def cells_in_between_horizontal_line_from_cell(cell)
    start_col, end_col = [col, cell.col].minmax
    [*(start_col..end_col)][1..-2].map { |col| Cell.new(cell.row, col) }
  end

  def cells_in_between_vertical_line_from_cell(cell)
    start_row, end_row = [row, cell.row].minmax
    [*(start_row..end_row)][1..-2].map { |row| Cell.new(row, cell.col) }
  end

  def cells_in_between_diagonal_line_from_cell(cell)
    row_range = range(row, cell.row)
    col_range = range(col, cell.col)
    whole_diagonal = row_range.zip(col_range)

    whole_diagonal[1..-2].map { |(row, col)| Cell.new(row, col) }
  end

  def cells_in_between_anti_diagonal_line_from_cell(cell)
    row_range = range(row, cell.row)
    col_range = range(col, cell.col)
    whole_diagonal = row_range.zip(col_range)

    whole_diagonal[1..-2].map { |(row, col)| Cell.new(row, col) }
  end

  def valid?(row, col)
    row.between?(0, 7) && col.between?(0, 7)
  end

  def jump(row_step: 0, col_step: 0)
    row_after = row + row_step
    col_after = col + col_step
    return nil unless valid?(row_after, col_after)

    Cell.new(row_after, col_after)
  end

  def to_notation
    first_char = Cell.col_to_notation(col)
    second_char = Cell.row_to_notation(row)
    first_char + second_char
  end

  def to_s
    to_notation
  end

  alias == eql?
end
