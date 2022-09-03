# frozen_string_literal: true

class Move
  attr_reader :origin, :target

  def initialize(origin:, target:)
    @origin = origin
    @target = target
  end

  def board_after_move(board)
    piece = board.get_piece_at(origin)
    board.board_after_clear_piece_at(origin).board_after_set_piece_at(target, piece)
  end

  def castle_status_after_move(castle_status)
    castle_status
  end

  def name
    'normal'
  end
end
