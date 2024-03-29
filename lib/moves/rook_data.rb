# frozen_string_literal: true

module RookData
  def mark_rook_move_by_side(castle_status)
    if origin == default_rook_postition_at_kingside(castle_status)
      castle_status.mark_rook_moved(true)
    elsif origin == default_rook_postition_at_queenside(castle_status)
      castle_status.mark_rook_moved(false)
    else
      castle_status
    end
  end

  def default_rook_postition_at_kingside(castle_status)
    if castle_status.color == Color::BLACK
      Cell.for('H8')
    else
      Cell.for('H1')
    end
  end

  def default_rook_postition_at_queenside(castle_status)
    if castle_status.color == Color::BLACK
      Cell.for('A8')
    else
      Cell.for('A1')
    end
  end
end
