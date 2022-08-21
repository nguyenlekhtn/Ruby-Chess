class HalfMove
  attr_reader :game

  def initialize(game)
    @game = game
  end
  def play
    return 'checkmated' if analyst.checkmated?
    return 'stalemated' if analyst.stalemated?
    
    puts "#{game.active_color}'s turn"
    puts game.board
    start_position = get_valid_start_position
    legal_moves = analyst.legal_moves_of_a_piece(start_position)
    puts "Legal moves: #{legal_moves.map { |lm| lm.target.to_s }}"
    move = get_valid_move(start_position)
    game.change_board_by_move(move)
  end

  def analyst
    Analyst.new(game)
  end

  def get_valid_start_position
    loop do
      puts 'Enter start position'
      position = position_from_input
      return position if validate_start_position(position)
    end
  end

  def position_from_input
    loop do
      position = Cell.for(player_input)
      return position if position

      puts 'Invalid position input'
    end
  end

  def validate_start_position(start_position)
    if !game.position_has_piece_with_active_color?(start_position)
      puts "Start position has no owner's piece"
      return false
    elsif analyst.legal_moves_of_a_piece(start_position).none?
      puts 'Piece at start position can\'t move to anywhere'
      return false
    end

    true
  end

  private

  def player_input
    gets.chomp
  end
end