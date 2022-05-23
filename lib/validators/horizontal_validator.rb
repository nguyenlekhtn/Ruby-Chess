class HorizontalValidator < Validator
  def initialize(board)
    super(board)
  end

  def valid?(start_pos, end_pos)
    false
  end
end