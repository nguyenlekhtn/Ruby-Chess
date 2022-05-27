class DifferentColorValidator < Validator
  def valid?(start_pos, end_pos)
    !board.same_color_between_two_positions?(start_pos, end_pos)
  end
end
