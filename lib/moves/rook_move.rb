# frozen_string_literal: true

class RookMove < Move
  include RookData

  def castle_status_after_move(castle_status)
    mark_rook_move_by_side(castle_status)
  end
end
