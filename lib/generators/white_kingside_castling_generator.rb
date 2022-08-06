class WhiteKingsiteCastlingGenerator < Generator
  def cells(origin)
    neighbors(origin).filter { |neighbor| valid?(origin, neighbor) }
  end

  def neighbors(pos)
    [Cell.for('G1')]
  end
  

  def able_to_castle?(origin)
    color = game.board.get_color_at(origin)

    return false if origin != Cell.for('E1')
    return false unless game.player_can_castle_kingside?(Color::WHITE)
    return false if Analyst.new(game).king_in_check?(color)
  end
end
