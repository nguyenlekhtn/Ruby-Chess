# frozen_string_literal: true

module NormalMove
  def generate_moves(origin)
    cells(origin).map { |target| Move.new(origin:, target:) }
  end
end
