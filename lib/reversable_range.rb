# frozen_string_literal: true

module ReversableRange
  def range(a, b)
    a < b ? a.upto(b) : a.downto(b)
  end
end
