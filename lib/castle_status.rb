class CastleStatus
  attr_reader :black_side, :white_side

  def initialize(black: CastleStatusForColor.new, white: CastleStatusForColor.new)
    @black_side = black
    @white_side = white
  end

  def set_status_by_color(castle_status_by_color)
    color = castle_status_by_color.color

    case color
    when Color::BLACK
      @black_side = castle_status_by_color
    when Color::WHITE
      @white_side = castle_status_by_color
    end
  end

  def able_to_castle?(color, is_kingside)
    color_side(color).able_to_castle_at_side?(is_kingside)
  end

  def mark_rook_moved(color, is_kingside)
    color_side(color).mark_rook_moved(is_kingside)
  end
  

  def mark_king_moved(color)
    color_side(color).mark_king_moved
  end

  def to_notation
    black_notation = black_side.to_notation
    white_notation = white_side.to_notation

    return '-' if black_notation.empty? && white_notation.empty?

    "#{white_notation}#{black_notation.downcase}"
  end

  def get_status_by_color(color)
    case color
    when Color::BLACK
      black_side
    when Color::WHITE
      white_side
    end
  end

  private

  def color_side(color)
    if color == Color::BLACK
      black_side
    else
      white_side
    end
  end

  def eql?(other)
    other.class == self.class && other.black_side == @black_side && other.white_side == @white_side
  end


  private
  attr_writer :black_side, :white_side
end