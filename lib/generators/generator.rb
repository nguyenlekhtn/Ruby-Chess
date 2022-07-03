class Generator
  attr_reader :board

  def initialize(board:)
    @board = board
  end

  def cells(origin)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end