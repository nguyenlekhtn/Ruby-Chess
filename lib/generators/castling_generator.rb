class CastlingGenerator < Generator
  attr_reader :side

  def initialize(game, side)
    super(game)
    @side = side
  end

  def cells(_origin)
    if able_to_castle?
      [neighbor]
    else
      []
    end
  end

  def default_rook_position
    Cell.new(default_king_row, default_rook_column)
  end

  def positions_betwen_king_and_rook
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def king_jump_step
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
  
  def neighbor
    default_king_position.jump_horizontal(king_jump_step)
  end

  def able_to_castle?

    return false unless board.get_piece_at(default_king_position) == King.new(color) && board.get_piece_at(default_rook_position) == Rook.new(color)
    
    return false unless game.player_can_castle_kingside?(color)
    return false unless positions_betwen_king_and_rook.all? { |position| board.empty_at?(position) }
    return false if Analyst.new(game).king_in_check?(color)
    return false if positions_betwen_king_and_rook.any? { |position| Analyst.new(game).position_attackable_by_player(position:, color: color.opposite) }

    true
  end

  def default_king_position
    side.default_king_position
  end

  def default_king_row
    side.default_king_row
  end

  def default_king_column
    side.default_king_column
  end

  def color
    side.color
  end
end
