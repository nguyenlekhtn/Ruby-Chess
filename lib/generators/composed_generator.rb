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
end
