# frozen_string_literal: true

class KingMove < Move
  def castle_status_after_move(castle_status)
    castle_status.mark_king_moved
  end
end
