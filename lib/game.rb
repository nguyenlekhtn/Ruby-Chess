# frozen_string_literal: true

class Game
  attr_reader :active_color, :board, :checkmate_checker, :piece_move_validator

  def initialize(**opts)
    @board = opts[:board] || Board.for
    @active_color = opts[:color] || Color::WHITE
    @checkmate_checker = CheckmateChecker.new(board)
    @piece_move_validator = PieceTypeMoveValidator.new(board)
  end

  # def legal_move?(piece, start, goal)

  # end

  def play
    # until checkmated? || staledmate? || draw_declared?
    loop do
      # player_turn
      puts "#{active_color}'s turn"
      puts board
      result = end_game_condition
      if result
        puts result
        break
      end
      start_pos, end_pos = move_from_player
      move_piece(start_pos, end_pos)
      switch_active_color
    end
  end

  def end_game_condition
    if checkmated?
      return "Checkmate. Player #{active_color} won"
    end

    nil
  end

  def player_turn
    puts "#{active_color}'s turn"
    puts board
    start_pos, end_pos = move_from_player
    move_piece(start_pos, end_pos)
  end

  def play
    puts "#{active_color}'s turn"
    puts board
    
    # move_piece(start_pos, end_pos)
  end

  def valid_start_position
    loop do
      valid_result = retrieve_start_position

      return valid_result if valid_result
    end
  end

  private def position_from_input(input = gets.chomp)
    position = Cell.for(input)

    return positon if position

    puts "Wrong format"
  end

  private def position_if_piece_at_it_belongs_to_active_player(position)
    return position if board.same_color_at_cell?(position, active_color)
    
    puts "Start position has no owner's pieces" 
  end

  private def start_position_if_player_piece_at_it_is_movable(start_position)
    legal_moves = Navigator.new(self).neighbors_of_a_piece(start_position)
    return start_position unless legal_moves.length == 0

    'Piece at start position can\'t move to anywhere'
  end

  def retrieve_start_position
    return position_from_input.then do { |position| check_if_owner_piece?(position) }
                       &.then { |position| start_position_if_player_piece_at_it_is_movable(position) }
  end

  def move_from_player
    loop do
      move = get_move
      return move if move
    end
  end

  def get_move
    puts 'Enter start and end position (A1D2)'
    input = player_input
    positions = get_positions_from_input(input)
    if positions.nil?
      puts 'Wrong input format'
      return nil
    end

    start_pos, end_pos = positions
    if board.empty_at?(start_pos) || board.get_piece_at(start_pos).color != active_color
      puts "Start position has no owner's pieces"
      return nil
    end

    unless move_valid?(start_pos, end_pos)
      piece = board.get_piece_at(start_pos)
      puts "#{piece} can't move from #{start_pos} to #{end_pos}"
      return nil
    end

    [start_pos, end_pos]
  end

  def checkmated?
    checkmate_checker.checkmated?(active_color)
  end

  def any_opposite_piece_can_attack_king?
    
  end

  def move_valid?(start_pos, end_pos)
    piece = board.get_piece_at(start_pos)

    return false if board.same_color_between_two_positions?(start_pos, end_pos)

    piece_move_validator.valid?(start_pos, end_pos)
  end

  def player_input
    gets.chomp
  end

  def get_positions_from_input(input)
    format = /[A-H][1-8][A-H][1-8]/i
    return nil unless input.match(format)

    [Cell.for(input[0..1]), Cell.for(input[2..3])]
  end

  def move_piece(start_pos, end_pos)
    piece = board.get_piece_at(start_pos)
    board.clear_piece_at(start_pos)
    board.set_piece_at(end_pos, piece)
  end

  def switch_active_color
    @active_color = @active_color.opposite
  end
end
