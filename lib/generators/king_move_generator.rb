class KingMoveGenerator < Generator
  attr_reader :navigator

  def initialize(game)
    super
    @navigator = Navigator.new(game)
  end

  def cells(origin)
    color = board.get_color_at(origin)
    neighbors(origin)
  end

  def neighbors(origin)
    [
      [0, -1],
      [0, 1],
      [-1, 0],
      [1, 0],
      [-1, -1],
      [-1, 1],
      [1, -1],
      [1, 1]
    ].map { |row_step, col_step| origin.jump(row_step:, col_step:) }.compact
  end
end
