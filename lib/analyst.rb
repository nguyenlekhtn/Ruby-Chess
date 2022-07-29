class Analyst
  attr_reader :board, :game

  def initialize(game)
    @game = game
    @board = game.board
  end

  def king_in_check_after_move?(origin, target)
    piece = board.get_piece_at(origin)
    color = board.get_color_at(origin)
    king_position = board.get_king_position(color)
    board_after_move = board.board_after_clear_piece_at(origin).board_after_set_piece_at(target, piece)
    Navigator.new(Game.new(board: board_after_move)).theoretical_moves_of_a_player(color.opposite).include?(king_position)
  end
end
