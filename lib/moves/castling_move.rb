class CastlingMove
  attr_reader :generator

  def initialize(castling_generator)
    @generator = castling_generator
  end

  def board_after_move(board)
    king_old_position = generator.default_king_position
    king = board.get_piece_at(king_old_position)
    king_new_position = king_old_position.jump_horizontal(generator.king_jump_step)
    board_after_king_moved =  board.board_after_clear_piece_at(king_old_position).board_after_set_piece_at(king_new_position, king)
    rook_old_positon = generator.default_rook_position
    rook = board.get_piece_at(rook_old_positon)  
    rook_new_position = generator.rook_new_position
    board_after_king_moved.board_after_clear_piece_at(rook_old_positon).board_after_set_piece_at(rook_new_position, rook)
  end
end