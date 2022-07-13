class Navigator
  attr_reader :board

  def initialize(game:)
    @game = game
  end

  def cells_from_a_piece(origin)
    piece = board.get_piece_at(origin)
    piece.neighbors
  end
end