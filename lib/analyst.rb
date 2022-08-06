class Analyst
  attr_reader :game

  def initialize(game)
    @game = game
  end

  def board
    game.board
  end

  def king_in_check_after_move?(origin, move)
    color = board.get_color_at(origin)
    target = move[:cell]
    generator = move[:generator]
    board_after_move = generator.move_piece(origin, target)
    Analyst.new(Game.new(board: board_after_move)).king_in_check?(color)
  end

  def king_in_check?(color)
    king_position = board.get_king_position(color)
    theoretical_moves_of_a_player(color.opposite).include?(king_position)
  end

  def current_king_in_check?
    king_in_check?(game.active_color)
  end

  def neighbors_of_a_piece(origin)
    legal_moves_of_a_piece(origin).map { |move| move[:cell] }
  end

  def theoretical_neighbors_of_a_piece(origin)
    theoretical_moves_of_a_piece(origin).map { |move| move[:cell] }
  end

  def theoretical_moves_of_a_piece(origin)
    piece = board.get_piece_at(origin)
    piece.moves(game:, origin:).reject do |move|
      board.same_color_between_two_positions?(origin, move[:cell])
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
      king_in_check_after_move?(origin, move)
    end
  end
end
