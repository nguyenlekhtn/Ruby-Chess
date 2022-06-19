class PieceTypeMoveValidator < Validator
  def valid?(start_pos, end_pos)
    piece = board.get_piece_at(start_pos)
    validators(piece).any? { |validator| validator.valid?(start_pos, end_pos) }
  end

  def validators(piece)
    piece.validators_class.map { |it| it.new(board) }
  end
end
