# frozen_string_literal: true

class Game
  attr_reader :active_color, :castle
  attr_accessor :board

  def initialize(**opts)
    @board = opts[:board] || Board.for
    @active_color = opts[:color] || Color::WHITE
    @castle = opts[:castle] || { 'black' => { queenside: true, kingside: true },
                                 'white' => { queenside: true, kingside: true } }
  end

  def position_has_piece_with_active_color?(position)
    board.same_color_at_cell?(position, active_color)
  end

  def switch_active_color
    @active_color = @active_color.opposite
  end

  def player_can_castle?(color:, side:)
    castle[color.value][side]
  end

  def player_can_castle_kingside?(color)
    player_can_castle?(color:, side: :kingside)
  end

  def change_board_by_move(move)
    @board = move.board_after_move(board)
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'board'        => @board,
      'color'        => @active_color,
      'castle'       => @castle 
    }.to_json(*args)
  end

  def self.json_create(object)
    new(board: object['board'], color: object['color'], castle: object['castle'])
  end
end
