class KingMoveGenerator < Generator
  attr_reader :navigator

  def initialize(game)
    super
    @navigator = Navigator.new(game)
  end

  def cells(origin)
    color = board.get_color_at(origin)
    neighbors(origin).reject { |neighbor| be_attackable_by_opposite_player_at_position?(color:, position: neighbor) }
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

  def be_attackable_by_opposite_player_at_position?(color:, position:)
    navigator.theoretical_moves_of_a_player(color.opposite).include?(position)
  end
end
