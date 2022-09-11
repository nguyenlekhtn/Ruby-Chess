class CastleStatus
  def initialize(black: CastleStatusForColor.new, white: CastleStatusForColor.new)
    @black_side = black
    @white_side = white
  end

  def able_to_castle?(color, is_kingside)
    color_side(color).able_to_castle?(is_kingside)
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

  private

  def color_side(color)
    if color == Color::BLACK
      black_side
    else
      white_side
    end
  end

  attr_reader :black_side, :white_side
end