# frozen_string_literal: true

class BoardDisplay
  attr_reader :board, :notation_convertor

  def initialize(board_obj)
    @board = board_obj.grid
    @notation_convertor = Cell
  end

  def cell_content(piece)
    "#{piece} "
  end

  def background_color(row_index, col_index)
    if (row_index + col_index).even?
      :green
    else
      :white
    end
  end

  def cell(piece, row_index, col_index)
    cell_content(piece).colorize(background: background_color(row_index, col_index))
  end

  def row_content(board_row, row_index, active_cells_in_row = [])
    board_row.map.with_index do |piece, col_index|
      next cell(piece, row_index, col_index) if active_cells_in_row.none? { |cell| cell.col == col_index }

      cell(piece, row_index, col_index).on_red
    end.join
  end

  def row(board_row, row_index, cells_in_row = [])
    row_notation = notation_convertor.row_to_notation(row_index)
    "#{row_notation} #{row_content(board_row, row_index, cells_in_row)} #{row_notation}"
  end

  def board_content(active_cells = [])
    board.map.with_index do |board_row, row_index|
      cells_in_row = active_cells.select { |cell| cell.row == row_index }
      row(board_row, row_index, cells_in_row)
    end.reverse.join("\n")
  end

  def col_notations
    notations = (0..7).map { |it| notation_convertor.col_to_notation(it) }.join(' ')
    "  #{notations}"
  end

  def box
    <<~BOX
      #{col_notations}
      #{board_content}
      #{col_notations}
    BOX
  end

  def show(active_cells)
    <<~BOX
      #{col_notations}
      #{board_content(active_cells)}
      #{col_notations}
    BOX
  end
end
