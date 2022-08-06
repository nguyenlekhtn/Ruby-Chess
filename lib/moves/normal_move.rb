module NormalMove
  def move_piece(origin, target)
    piece = board.get_piece_at(origin)
    board.board_after_clear_piece_at(origin).board_after_set_piece_at(target, piece)
  end
end
