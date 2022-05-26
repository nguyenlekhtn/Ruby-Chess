class Validator
  attr_reader :board

  def initialize(board)
    @board = board
  end

  def valid?(start_pos, end_pos)
    raise NotImplementedError
  end

  def piece_in_start_and_end_pos_not_same_color?(start_pos, end_pos)
    !board.same_color_between_two_positions?(start_pos, end_pos)
  end
end
