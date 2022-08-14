class Analyst
  attr_reader :game

  def initialize(game)
    @game = game
  end

  def board
    game.board
  end

  def king_in_check_after_move?(move)
    color = board.get_color_at(move.origin)
    board_after_move = move.board_after_move
    Analyst.new(Game.new(board: board_after_move)).king_in_check?(color)
  end

  def king_in_check?(color)
    king_position = board.get_king_position(color)
    position_attackable_by_player(position: king_position, color: color.opposite)
  end

  def position_attackable_by_player(position:, color:)
    theoretical_moves_of_a_player(color).include?(position)
  end

  def current_king_in_check?
    king_in_check?(game.active_color)
  end

  def neighbors_of_a_piece(origin)
    legal_moves_of_a_piece(origin).map { |move| move.target }
  end

  def theoretical_neighbors_of_a_piece(origin)
    theoretical_moves_of_a_piece(origin).map { |move| move.target }
  end

  def theoretical_moves_of_a_piece(origin)
    piece = board.get_piece_at(origin)
    piece.moves(game:, origin:).reject do |move|
      board.same_color_between_two_positions?(origin, move.target)
    end
  end

  def theoretical_moves_of_a_player(color)
    coordinates_of_all_pieces_by_a_player(color).map do |coordinate|
      theoretical_neighbors_of_a_piece(coordinate)
    end.flatten
  end

  def coordinates_of_all_pieces_by_a_player(color)
    board.all_cells_have_color(color)
  end

  def legal_moves_of_a_piece(origin)
    theoretical_moves_of_a_piece(origin).reject do |move|
      king_in_check_after_move?(move)
    end
  end
end
