class CastleStatus
  def initialize
    @is_king_not_moved = { 'black' => true, 'white' => true }
    @is_rook_not_moved = { 'black' => { queenside: true, kingside: true },
                           'white' => { queenside: true, kingside: true }
                         }
  end

  def able_to_castle?(color, is_kingside)
    king_not_moved?(color) && rook_not_moved?(color, is_kingside)
  end
  
  def mark_rook_moved(color, is_kingside)
    @is_rook_not_moved[color.value][side(is_kingside)] = false
  end

  def mark_king_moved(color)
    @is_king_not_moved[color.value]  = false
  end

  def king_not_moved?(color)
    @is_king_not_moved[color.value]
  end

  def rook_not_moved?(color, is_kingside)
    @is_rook_not_moved[color.value][side(is_kingside)]
  end
  
  def side(is_kingside)
    return :kingside if is_kingside

    :queenside
  end

  private
  attr_reader :status
end