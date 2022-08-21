class HalfMove
  attr_reader :game

  def initialize(game)
    @game = game
  end
  def play
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
end