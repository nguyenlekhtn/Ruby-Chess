# frozen_string_literal: true

module NormalMove
  def generate_moves(origin)
    cells(origin).map { |target| Move.new(origin:, target:) }
  end

  def generate_capturable_move?
    true
  end
end
