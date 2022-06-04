# frozen_string_literal: true

class Game
  COLOR = %w[white black].freeze

  attr_reader :active_color, :board

  def initialize(**opts)
    @board = opts[:board] || Board.new
    @active_color = active_color || 'white'
  end

  # def legal_move?(piece, start, goal)

  # end

  def play
    loop do
      player_turn
      switch_active_color
    end
  end

  def player_turn
    puts "#{active_color}'s turn"
    puts board
    start_pos, end_pos = move_from_player
    move_piece(start_pos, end_pos)
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

  def move_valid?(start_pos, end_pos)
    piece = board.get_piece_at(start_pos)

    return false if board.same_color_at_cell?(end_pos, active_color)

    return false if board.same_color_between_two_positions?(start_pos, end_pos)
    
    piece.validators.any? { |validator| validator.valid?(start_pos, end_pos) }
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
    @active_color = if active_color == COLOR.first
                      COLOR.last
                    else
                      COLOR.first
                    end
  end
end
