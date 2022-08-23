# frozen_string_literal: true

require_relative '../reversable_range'

class CastlingGenerator < Generator
  include ReversableRange

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
    positions_from_king_to_rook.reject { |position| [default_king_position, default_rook_position].include? position }
  end

  def positions_from_king_to_rook
    range(default_king_column, default_rook_column).map { |col| Cell.new(default_king_row, col) }
  end

  def positions_king_moves_over
    range(default_king_column, neighbor.col).map { |col| Cell.new(default_king_row, col) }
  end

  def king_jump_step
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def neighbor
    default_king_position.jump_horizontal(king_jump_step)
  end

  def able_to_castle?
    return false unless king_and_rook_at_default_positions?
    return false unless player_can_castle?
    return false unless all_postions_between_king_and_rook_empty?
    return false if king_in_check?
    return false if any_positions_king_moves_over_put_it_in_check?

    true
  end

  def player_can_castle?
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def all_postions_between_king_and_rook_empty?
    positions_betwen_king_and_rook.all? { |position| board.empty_at?(position) }
  end

  def king_in_check?
    Analyst.new(game).king_in_check?(color)
  end

  def king_and_rook_at_default_positions?
    board.get_piece_at(default_king_position) == King.new(color) && board.get_piece_at(default_rook_position) == Rook.new(color)
  end

  def any_positions_king_moves_over_put_it_in_check?
    positions_king_moves_over.any? do |position|
      Analyst.new(game).position_attackable_by_player?(position:, color: color.opposite)
    end
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

  def generate_capturable_move?
    false
  end
end
