class Generator
  attr_reader :game

  def initialize(game)
    @game = game
  end

  def board
    game.board
  end

  def cells(origin)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def moves(origin)
    cells(origin).map { |cell| { cell:, generator: self } }
  end
end
