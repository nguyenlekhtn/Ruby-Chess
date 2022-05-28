# frozen_string_literal: true

class BoardBuilder
  attr_reader :board

  def initialize(board)
    @board = board
  end

  def cell(string)
    if %w[r n b q k p].include? string.downcase
      Piece.for(string, board)
    elsif ('1'..'8').include?(string)
      Array.new(string.to_i) { Piece.for('', board) }
    else
      throw 'Invalid FEN notation'
    end
  end

  def row(string)
    return Array.new(8) { Piece.for('', board) } if string == '8'

    string.chars.map { |char| cell(char) }.flatten
  end

  def whole(string)
    string.split('/').map { |row_string| row(row_string) }.reverse
  end
end
