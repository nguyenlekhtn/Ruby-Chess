# frozen_string_literal: true

class Controller
  attr_reader :game

  def initialize
    @game = Game.new
  end

  def analyst
    Analyst.new(game)
  end

  def end_game_condition
    return "Checkmate. Player #{active_color} won" if checkmated?

    nil
  end
  
  def play
    loop do
      puts "#{game.active_color}'s turn"
      puts game.board
      start_position = get_valid_start_position
      legal_moves = analyst.legal_moves_of_a_piece(start_position)
      puts "Legal moves: #{legal_moves.map { |it| it.fetch(:cell).to_s }}"
      move = get_valid_move(start_position)
      move => { cell: end_position, generator: }
      puts start_position, end_position
      board_after_move = generator.move_piece(start_position, end_position)
      game.board = board_after_move
      game.switch_active_color
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

  def get_valid_move(start_position)
    loop do
      puts 'Enter end position'
      end_position = position_from_input
      move = validate_move(start_position, end_position)
      return move if move
    end
  end

  private def player_input
    gets.chomp
  end

  def validate_start_position(start_position)
    if !game.position_has_piece_with_active_color?(start_position)
      puts "Start position has no owner's piece"
      return false
    elsif analyst.neighbors_of_a_piece(start_position).none?
      puts 'Piece at start position can\'t move to anywhere'
      return false
    end

    true
  end

  def validate_end_position(start_position, end_position)
    legal_moves = analyst.neighbors_of_a_piece(start_position)

    unless legal_moves.include? end_position
      puts 'Piece at start position can\'t move to end position'
      return false
    end

    true
  end

  def validate_move(start_position, end_position)
    legal_moves = analyst.legal_moves_of_a_piece(start_position)
    move = legal_moves.find { |lm| lm.fetch(:cell) == end_position }

    if move.nil?
      puts 'Piece at start position can\'t move to end position'
      return nil
    end

    move
  end

  def position_from_input
    loop do
      position = Cell.for(player_input)
      return position if position

      puts 'Invalid position input'
    end
  end

  def checkmated?
    checkmate_checker.checkmated?(active_color)
  end

  def get_positions_from_input(input)
    format = /[A-H][1-8][A-H][1-8]/i
    return nil unless input.match(format)

    [Cell.for(input[0..1]), Cell.for(input[2..3])]
  end
end