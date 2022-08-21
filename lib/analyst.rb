# frozen_string_literal: true

class Analyst
  attr_reader :game

  def initialize(game)
    @game = game
  end

  def checkmated?
    
  end

  def board
    game.board
  end

  def king_in_check_after_move?(move)
    return false if move.name == 'castling'

    color = board.get_color_at(move.origin)
    board_after_move = move.board_after_move(board)
    Analyst.new(Game.new(board: board_after_move)).king_in_check?(color)
  end

  def king_in_check?(color)
    king_position = board.get_king_position(color)
    position_attackable_by_player?(position: king_position, color: color.opposite)
  end

  def position_attackable_by_player?(position:, color:)
    capture_moves_of_a_player(color).any? { |move| move.target == position }
  end

  def current_king_in_check?
    king_in_check?(game.active_color)
  end

  def theoretical_moves_of_a_piece(origin)
    piece = board.get_piece_at(origin)
    piece.moves(game:, origin:).reject do |move|
      board.same_color_between_two_positions?(origin, move.target)
    end
  end

  def capture_moves_of_a_piece(origin)
    piece = board.get_piece_at(origin)
    piece.capturable_moves(game:, origin:).reject do |move|
      board.same_color_between_two_positions?(origin, move.target)
    end
  end

  def theoretical_moves_of_a_player(color)
    player_coords = coordinates_of_all_pieces_by_a_player(color)
    player_coords.each_with_object([]) do |coord, arr|
      moves = theoretical_moves_of_a_piece(coord)
      arr.concat(moves)
    end
  end

  def capture_moves_of_a_player(color)
    player_coords = coordinates_of_all_pieces_by_a_player(color)
    player_coords.each_with_object([]) do |coord, arr|
      moves = capture_moves_of_a_piece(coord)
      arr.concat(moves)
    end
  end

  def coordinates_of_all_pieces_by_a_player(color)
    board.all_cells_have_color(color)
  end

  def legal_moves_of_a_piece(origin)
    theoretical_moves_of_a_piece(origin).reject do |move|
      king_in_check_after_move?(move)
    end
  end

  def moves_of_a_piece(origin, type)
    case type
    when 'legal'
      legal_moves_of_a_piece(origin)
    when 'theory'
      theoretical_moves_of_a_piece(origin)
    when 'capture'
      capture_moves_of_a_piece(origin)
    else
      throw 'Invalid piece move type'
    end
  end

  def moves_of_a_player(color, type)
    player_coords = coordinates_of_all_pieces_by_a_player(color)
    player_coords.each_with_object([]) do |coord, arr|
      moves = moves_of_a_piece(coord, type)
      arr.concat(moves)
    end
  end
end
