# frozen_string_literal: true

class HalfMove
  include OutputColor
  attr_reader :game, :observer

  def initialize(game, observer = nil)
    @game = game
    @observer = observer
  end

  def play
    puts "Game states: #{game.to_notation}"
    return :checkmated if analyst.checkmated?
    return :stalemated if analyst.stalemated?

    highlight "#{game.active_color}'s turn"
    puts 'Your king is in check' if analyst.king_in_check?(game.active_color)
    puts game.board
    start_position = get_valid_start_position
    legal_moves = analyst.legal_moves_of_a_piece(start_position)
    legal_cells_to_move = legal_moves.map(&:target)
    puts game.board.show(legal_cells_to_move)
    puts "Legal moves: #{legal_cells_to_move.map(&:to_s)}"
    move = get_valid_move(start_position)
    game.change_state_by_move(move)
    :continue
  end

  def analyst
    Analyst.new(game)
  end

  def get_valid_start_position
    loop do
      print 'Enter start position (e.g: A1)'
      position = position_from_input
      return position if validate_start_position(position)
    end
  end

  def position_from_input(save_ability: true)
    loop do
      input = if save_ability
                print ', or 0 to save the current state of game: '
                player_input_with_save_ability
              else
                player_input
              end
      position = Cell.for(input)
      return position if position

      error 'Invalid position input, please enter again:'
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
      print 'Enter end position (ones highlight in red): '
      end_position = position_from_input(save_ability: false)
      move = validate_move(start_position, end_position)
      return move if move
    end
  end

  def validate_move(start_position, end_position)
    legal_moves = analyst.legal_moves_of_a_piece(start_position)
    move = legal_moves.find { |lm| lm.target == end_position }

    error 'Piece at start position can\'t move to end position' if move.nil?

    move
  end

  private

  def player_input
    gets.chomp
  end

  def player_input_with_save_ability
    loop do
      input = player_input
      return input if saved || input != '0' || observer.nil?

      observer.save(game)
      print 'Please continue to input position: '
    end

    input
  end
end
