# frozen_string_literal: true

class Game
  attr_reader :active_color, :castle, :castle_status
  attr_accessor :board

  def initialize(**opts)
    @board = opts[:board] || Board.for
    @active_color = opts[:color] || Color::WHITE
    @castle_status = opts[:castle_status] || CastleStatus.new
  end

  def position_has_piece_with_active_color?(position)
    board.same_color_at_cell?(position, active_color)
  end

  def switch_active_color
    @active_color = @active_color.opposite
  end

  def player_able_to_castle?(color, is_kingside)
    castle_status.able_to_castle?(color, is_kingside)
  end

  def change_board_by_move(move)
    @board = move.board_after_move(board)
  end

  def change_castle_status_by_move(move)
    color = board.get_color_at(move.target)
    current_cs_by_color = castle_status.get_status_by_color(color)
    cs_after_move = move.castle_status_after_move(current_cs_by_color)
    castle_status.set_status_by_color(cs_after_move)
  end

  def change_state_by_move(move)
    change_board_by_move(move)
    change_castle_status_by_move(move)
  end

  def to_notation
    "#{board.to_notation} #{active_color.to_notation} #{castle_status.to_notation}"
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'board'        => @board,
      'color'        => @active_color,
      'castle status'       => @castle_status 
    }.to_json(*args)
  end

  def self.json_create(object)
    new(board: object['board'], color: object['color'], castle_status: object['castle status'])
  end
end
