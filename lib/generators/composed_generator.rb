class ComposedGenerator
  attr_reader :generators

  def initialize(generators)
    @generators = generators
  end

  def cells(origin)
    generators.map do |generator|
      generator.cells(origin)
    end.flatten.uniq
  end
end
