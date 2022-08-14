module NormalMove
  def generate_moves(origin)
    cells(origin).map { |target| Move.new(origin:, target:, board:) }
  end
end
