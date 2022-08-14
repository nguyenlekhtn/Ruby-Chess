class CastlingGenerator < Generator
  def cells(_origin)
    if able_to_castle?
      [neighbor]
    else
      []
    end
  end

  def neighbor
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def color
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def positions_betwen_king_and_rook
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def default_rook_position
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def default_king_position
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
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
