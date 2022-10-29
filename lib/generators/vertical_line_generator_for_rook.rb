# frozen_string_literal: true

require_relative '../moving_in_directions'

class VerticalLineGeneratorForRook < VerticalLineGenerator
  def generate_moves(origin)
    cells(origin).map { |target| RookMove.new(origin:, target:) }
  end
end
