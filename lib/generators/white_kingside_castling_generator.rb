class WhiteKingsideCastlingGenerator < Generator
  def cells(origin)
    if able_to_castle?
      [neighbor]
    else
      []
    end
  end

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
  

  def able_to_castle?

    return false unless board.get_piece_at(default_king_position) == King.new(color) && board.get_piece_at(default_rook_position) == Rook.new(color)
    
    return false unless game.player_can_castle_kingside?(color)
    return false unless positions_betwen_king_and_rook.all? { |position| board.empty_at?(position) }
    return false if Analyst.new(game).king_in_check?(color)
    return false if positions_betwen_king_and_rook.any? { |position| Analyst.new(game).position_attackable_by_player(position:, color: color.opposite) }

    true
  end
end
