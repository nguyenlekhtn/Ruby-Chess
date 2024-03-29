# frozen_string_literal: true

class ComposedGenerator
  attr_reader :generators

  def initialize(generators)
    @generators = generators
  end

  def cells(origin)
    generators.map do |generator|
      generator.cells(origin)
    end.flatten
  end

  def moves(origin)
    generators.map do |generator|
      generator.moves(origin)
    end.flatten
  end

  def generate_moves(origin)
    generators.map do |generator|
      generator.generate_moves(origin)
    end.flatten.uniq
  end
end
