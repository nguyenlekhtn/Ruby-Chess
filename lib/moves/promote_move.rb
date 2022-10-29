# frozen_string_literal: true

class PromoteMove < Move
  def board_after_move(board)
    piece = board.get_piece_at(origin)
    color = board.get_color_at(origin)
    promote_piece = Queen.new(color)
    board.board_after_clear_piece_at(origin)
         .board_after_set_piece_at(target, piece)
         .board_after_set_piece_at(target, promote_piece)
  end
end
