# frozen_string_literal: true

class CastlingMove < Move
  attr_reader :generator

  include RookData

  def initialize(castling_generator)
    origin = castling_generator.default_king_position
    target = origin.jump_horizontal(castling_generator.king_jump_step)
    super(origin:, target:)
    @generator = castling_generator
  end

  def board_after_move(board)
    # king_old_position = generator.default_king_position
    king = board.get_piece_at(origin)
    # king_new_position = king_old_position.jump_horizontal(generator.king_jump_step)
    board_after_king_moved = board.board_after_clear_piece_at(origin).board_after_set_piece_at(target, king)
    rook_old_positon = generator.default_rook_position
    rook = board.get_piece_at(rook_old_positon)
    rook_new_position = generator.rook_new_position
    board_after_king_moved.board_after_clear_piece_at(rook_old_positon).board_after_set_piece_at(rook_new_position,
                                                                                                 rook)
  end

  def castle_status_after_move(castle_status)
    mark_rook_move_by_side(castle_status).mark_king_moved
  end
end
