# frozen_string_literal: true

class HalfMove
  attr_reader :game, :observer

  def initialize(game, observer = nil)
    @game = game
    @observer = observer
  end

  def play
    puts "Game states: #{game.to_notation}"
    return :checkmated if analyst.checkmated?
    return :stalemated if analyst.stalemated?

    puts "#{game.active_color}'s turn"
    puts 'Your king is in check' if analyst.king_in_check?(game.active_color)
    puts game.board
    start_position = get_valid_start_position
    legal_moves = analyst.legal_moves_of_a_piece(start_position)
    puts "Legal moves: #{legal_moves.map { |lm| lm.target.to_s }}"
    move = get_valid_move(start_position)
    game.change_state_by_move(move)
    :continue
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
      position = Cell.for(player_input_with_save_ability)
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

  def get_valid_move(start_position)
    loop do
      puts 'Enter end position'
      end_position = position_from_input
      move = validate_move(start_position, end_position)
      return move if move
    end
  end

  def validate_move(start_position, end_position)
    legal_moves = analyst.legal_moves_of_a_piece(start_position)
    move = legal_moves.find { |lm| lm.target == end_position }

    puts 'Piece at start position can\'t move to end position' if move.nil?

    move
  end

  private

  def player_input
    gets.chomp
  end

  def player_input_with_save_ability
    puts 'You can enter 0 to save the current state of game'
    while (input = player_input) == '0' && !observer.nil?
      observer.save(game)
    end

    input
  end
end
