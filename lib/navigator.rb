class Navigator
  attr_reader :board, :game

  def initialize(game)
    @game = game
    @board = game.board
  end

  def neighbors_of_a_piece(origin)
    piece = board.get_piece_at(origin)
    piece.neighbors(game:, origin:).reject { |neighbor| board.same_color_between_two_positions?(origin, neighbor) }
  end
end