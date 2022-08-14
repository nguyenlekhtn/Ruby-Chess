class WhiteSide

  def default_king_position
    Cell.new(default_king_row, default_king_column)
  end

  def default_king_row
    0
  end

  def default_king_column
    4
  end

  def color
    Color::WHITE
  end
end