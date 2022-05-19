# frozen_string_literal: true

class BoardBuilder
  def cell(string)
    if %w[r n b q k p].include? string.downcase
      Piece.for(string)
    elsif ('1'..'8').include?(string)
      Array.new(string.to_i) { Piece.for('') }
    else
      throw 'Invalid FEN notation'
    end
  end

  def row(string)
    return Array.new(8) { Piece.for('') } if string == '8'

    string.chars.map { |char| cell(char) }.flatten
  end

  def whole(string)
    string.split('/').map { |row_string| row(row_string) }.reverse
  end
end
