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

  def coordinates_of_all_pieces_by_a_player(color)
    board.all_cells_have_color(color)
  end

  def legal_moves_of_a_player(color)
    coordinates_of_all_pieces_by_a_player(color).map do |coordinate|
      neighbors_of_a_piece(coordinate)
    end.flatten
  end
end