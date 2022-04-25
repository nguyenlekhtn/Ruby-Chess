require 'piece/piece'

class BoardBuilder
  def row(string)
    return Array.new(8) { Piece.new }
  end

  def whole(string)
    
  end
end