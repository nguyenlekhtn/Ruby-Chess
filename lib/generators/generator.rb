class Generator
  attr_reader :board, :game

  def initialize(game)
    @board = game.board
    @game = game
  end

  def cells(origin)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def moves(origin)
    cells(origin).map { |cell| { cell:, generator: self } }
  end

  def move_piece(origin, target); end
end
