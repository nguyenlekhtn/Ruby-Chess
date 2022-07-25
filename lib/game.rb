# frozen_string_literal: true

class Game
  attr_reader :active_color, :board, :checkmate_checker, :piece_move_validator, :navigator

  def initialize(**opts)
    @board = opts[:board] || Board.for
    @active_color = opts[:color] || Color::WHITE
    @checkmate_checker = CheckmateChecker.new(board)
    @piece_move_validator = PieceTypeMoveValidator.new(board)
    @navigator = Navigator.new(self)
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
    loop do
      puts "#{active_color}'s turn"
      puts board
      start_position = get_valid_start_position
      legal_moves = navigator.neighbors_of_a_piece(start_position)
      puts "Legal moves: #{legal_moves.map { |it| it.to_s }}"
      end_position = get_valid_end_position(start_position)
      puts start_position, end_position
      move_piece(start_position, end_position)
      switch_active_color
    end
  end

  def get_valid_start_position
    loop do
      puts 'Enter start position'
      position = position_from_input
      return position if validate_start_position(position)
    end
  end

  def get_valid_end_position(start_position)
    loop do
      puts 'Enter end position'
      end_position = position_from_input
      return end_position if validate_end_position(start_position, end_position)
    end
  end


  private def player_input
    gets.chomp
  end

  def validate_start_position(start_position)
    if !board.same_color_at_cell?(start_position, active_color)
      puts "Start position has no owner's piece"
      return false
    elsif Navigator.new(self).neighbors_of_a_piece(start_position).none?
      puts 'Piece at start position can\'t move to anywhere'
      return false
    end

    true
  end

  def validate_end_position(start_position, end_position)
    legal_moves = navigator.neighbors_of_a_piece(start_position)

    if !legal_moves.include? end_position
      puts 'Piece at start position can\'t move to end position'
      return false
    end

    true
  end

  def position_from_input
    loop do
      position = Cell.for(player_input)
      return position if position  

      puts "Invalid position input"
    end
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
