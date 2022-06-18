class CheckmateChecker
  attr_reader :board

  def initialize(board)
    @board = board
  end

  def checkmated?(active_color)
    king_position = board.get_king_position(active_color)

    opposite_cells = board.get_all_cells_have_color(active_color.opposite)

    king_in_check?(king_position:, opposite_cells:) && king_not_movable?(king_position:, opposite_cells:)
  end

  def king_in_check?(king_position:, opposite_cells:)
    opposite_cells.any? do |opposite_cell|
      opposite_piece = board.get_piece_at(opposite_cell)
      opposite_piece.move_valid?(opposite_cell, king_position)
    end
  end

  def king_not_movable?(king_position:, opposite_cells:)
    active_color = board.get_color_at(king_position)
    king_neighbors(king_position).all? do |king_neighbor|
      board.same_color_at_cell?(king_neighbor, active_color) || opposite_cells.any? do |opposite_cell|
        opposite_piece = board.get_piece_at(opposite_cell)
        opposite_piece.move_valid?(opposite_cell, king_neighbor)
      end
    end
  end

  def king_neighbors(pos)
    pairs = [
      [0,1],
      [0,-1],
      [-1,0],
      [1,0],
      [-1,-1],
      [-1,1],
      [1,-1],
      [1,1]
    ].freeze

    pairs.map do |(row_step, col_step)|
      pos.jump(row_step: row_step, col_step: col_step)
    end.compact
  end
end