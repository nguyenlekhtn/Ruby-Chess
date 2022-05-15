class Game
  def initialize(**opts)
    @board = opts[:board] || Board.new
  end
  def legal_move?(piece, start, goal)

  end
end