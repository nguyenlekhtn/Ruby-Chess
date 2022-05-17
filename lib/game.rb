class Game
  def initialize(**opts)
    @board = opts[:board] || Board.new
  end
  def legal_move?(piece, start, goal)

  end

  def play
    loop do
      piece, start_pos, end_pos = get_move_from_player
      move_piece(piece, start_pos, end_pos)
      switch_active_color
    end
  end

  def get_move_from_player
    input = player_input
    positions = get_postions_from_input(input)
    if positions.nil?
      puts "Wrong input format"
      return nil
    end
    start_pos, end_pos = postions
    if board.emptyAt?(start_pos)
      puts "Start postion has no pieces"
      return nil
    end

    piece = board.getPieceAt(start_pos)
    unless move_valid?(piece)
      puts "${piece} can't move from ${start_pos} to ${end_pos}"
      return nil
    end

    [piece, start_pos, end_pos]
  end
    
  def get_move_from_player
    loop do
      return get_move_from_player if get_move_from_player
    end
  end
      


  

  
  
end