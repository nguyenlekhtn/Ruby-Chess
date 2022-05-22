# frozen_string_literal: true

class Cell
  def self.for(notation)
    format = /[A-H][1-8]/
    return nil unless notation.match(format)

    row, col = notation_to_position(notation)
    new(row, col)
  end

  attr_reader :row, :col

  def self.notation_to_position(notation)
    col = notation[0].ord - 65
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

  def ==(other)
    other.class == self.class && other.row == @row && other.col == @col
  end

  def same_horizontal_line_with_cell?(cell)
    row == cell.row
  end

  def same_vertical_line_with_cell?(cell)
    col == cell.col
  end

  def same_diagonal_line_with_cell?(cell)
    col - row == cell.col - cell.row
  end
end
