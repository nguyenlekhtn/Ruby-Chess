module WhitePawnGenerator
  def generate_moves(origin)
    cells(origin).map do |target| 
      return Move.new(origin:, target:) if target.row != 7

      PromoteMove.new(origin:, target:)
    end
  end
end