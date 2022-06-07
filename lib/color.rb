module Color
  class Value
    attr_reader :value

    def initialize(value)
      @value = value.freeze
    end

    def ==(other)
      @value == other.value
    end

    def opposite
      return Value.new('black') if @value == 'white'
      return Value.new('white') if @value == 'black'
      
      self
    end

    alias_method :to_s, :value
  end

  BLACK = Value.new('black')
  WHITE = Value.new('white')
  BLANK = Value.new('')
end