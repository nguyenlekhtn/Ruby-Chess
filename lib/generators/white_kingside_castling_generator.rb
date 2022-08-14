class WhiteKingsideCastlingGenerator < CastlingGenerator
  def neighbor
    Cell.for('G1')
  end

  def color
    Color::WHITE
  end

  def positions_betwen_king_and_rook
    [Cell.for('F1'), Cell.for('G1')]
  end

  def default_rook_position
    Cell.for('H1')
  end

  def default_king_position
    Cell.for('E1')
  end
end
