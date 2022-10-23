module WhitePawnGenerator
  def generate_moves(origin)
    promote_row = 7
    cells(origin).map do |target|
      if target.row == promote_row
        PromoteMove.new(origin:, target:)
      else
        Move.new(origin:, target:)
      end
    end
  end
end