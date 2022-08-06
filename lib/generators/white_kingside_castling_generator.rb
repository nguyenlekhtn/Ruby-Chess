class WhiteKingsideCastlingGenerator < Generator
  def cells(origin)
    neighbors(origin).filter { |neighbor| valid?(origin, neighbor) }
  end

  def neighbors(pos)
    [Cell.for('G1')]
  end

  def color
    Color::WHITE
  end
  

  def able_to_castle?

    return false unless board.get_piece_at(Cell.for('E1')) == King.new(color) && board.get_piece_at(Cell.for('H1')) == Rook.new(color)
    
    return false unless game.player_can_castle_kingside?(color)
    return false if Analyst.new(game).king_in_check?(color)

    true
  end
end
