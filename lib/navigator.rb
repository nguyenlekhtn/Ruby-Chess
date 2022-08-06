class Navigator
  attr_reader :board, :game

  def initialize(game)
    @game = game
    @board = game.board
  end

  def neighbors_of_a_piece(origin)
    theoretical_neighbors_of_a_piece(origin).reject { |neighbor| king_in_check_after_move?(origin, neighbor) }
  end

  def theoretical_neighbors_of_a_piece(origin)
    theoretical_moves_of_a_piece(origin).map { |move| move.fetch(:cell) }
  end

  def theoretical_moves_of_a_piece(origin)
    piece = board.get_piece_at(origin)
    piece.moves(game:, origin:).reject do |move|
      board.same_color_between_two_positions?(origin, move.fetch(:cell))
    end
  end

  def legal_moves_of_a_piece(origin)
    theoretical_moves_of_a_piece(origin).reject do |move|
      king_in_check_after_move?(origin, move.fetch(:cell))
    end
  end

  def coordinates_of_all_pieces_by_a_player(color)
    board.all_cells_have_color(color)
  end

  def legal_moves_of_a_player(color)
    coordinates_of_all_pieces_by_a_player(color).map do |coordinate|
      neighbors_of_a_piece(coordinate)
    end.flatten
  end

  def theoretical_moves_of_a_player(color)
    coordinates_of_all_pieces_by_a_player(color).map do |coordinate|
      theoretical_neighbors_of_a_piece(coordinate)
    end.flatten
  end

  def king_in_check_after_move?(origin, target)
    Analyst.new(game).king_in_check_after_move?(origin, target)
  end
end
