# frozen_string_literal: true

class Game
  attr_reader :active_color, :checkmate_checker, :analyst, :castle
  attr_accessor :board

  def initialize(**opts)
    @board = opts[:board] || Board.for
    @active_color = opts[:color] || Color::WHITE
    @checkmate_checker = CheckmateChecker.new(board)
    @castle = opts[:castle] || { Color::BLACK => { queenside: true, kingside: true }, Color::WHITE => { queenside: true, kingside: true } }
    @analyst = Analyst.new(self)
  end

  def end_game_condition
    return "Checkmate. Player #{active_color} won" if checkmated?

    nil
  end

  def position_has_piece_with_active_color?(position)
    board.same_color_at_cell?(position, active_color)
  end

  private def player_input
    gets.chomp
  end

  def checkmated?
    checkmate_checker.checkmated?(active_color)
  end

  def switch_active_color
    @active_color = @active_color.opposite
  end

  def player_can_castle?(color:, side:)
    castle[color][side]
  end

  def player_can_castle_kingside?(color)
    player_can_castle?(color:, side: :kingside)
  end
end
