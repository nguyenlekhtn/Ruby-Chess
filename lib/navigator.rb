class Navigator
  attr_reader :board

  def initialize(game:)
    @game = game
  end

  def cells_from_a_piece(origin)
    piece = board.get_piece_at(origin)
    piece.neighbors.reject { |neighbor| board.same_color_between_two_positions?(origin, neighbor) }
  end
end