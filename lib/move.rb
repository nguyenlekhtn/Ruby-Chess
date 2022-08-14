class Move
  attr_reader :origin, :target, :board

  def initialize(origin:, target:, board:)
    @origin = origin
    @target = target
    @board = board
  end

  def piece
    board.get_piece_at(origin)
  end

  def board_after_move
    board.board_after_clear_piece_at(origin).board_after_set_piece_at(target, piece)
  end
end