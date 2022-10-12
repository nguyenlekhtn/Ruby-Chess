# frozen_string_literal: true

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

    def to_json(*args)
      {
        JSON.create_id => self.class.name,
        'value' => @value
      }.to_json(*args)
    end

    def self.json_create(object)
      new(object['value'])
    end

    def to_notation
      value[0]
    end

    alias to_s value
  end

  BLACK = Value.new('black')
  WHITE = Value.new('white')
  BLANK = Value.new('')
end
