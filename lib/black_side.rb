# frozen_string_literal: true

class BlackSide
  def default_king_position
    Cell.new(default_king_row, default_king_column)
  end

  def default_king_row
    7
  end

  def default_king_column
    4
  end

  def color
    Color::BLACK
  end
end
