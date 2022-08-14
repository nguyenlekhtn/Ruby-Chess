# frozen_string_literal: true

require 'colorize'

require_relative 'color'
require_relative 'reversable_range'
require_relative 'pieces/piece'
require_relative 'pieces/bishop'
require_relative 'pieces/king'
require_relative 'pieces/queen'
require_relative 'pieces/rook'
require_relative 'pieces/black_pawn'
require_relative 'pieces/white_pawn'
require_relative 'pieces/knight'
require_relative 'pieces/blank_piece'
require_relative 'board'
require_relative 'board_display'
require_relative 'board_builder'
require_relative 'cell'
require_relative 'game'
require_relative 'checkmate_checker'
require_relative 'moves/normal_move'
require_relative 'generators/generator'
require_relative 'generators/line_generator'
require_relative 'generators/diagonal_line_generator'
require_relative 'generators/horizontal_line_generator'
require_relative 'generators/vertical_line_generator'
require_relative 'generators/composed_generator'
require_relative 'generators/knight_move_generator'
require_relative 'generators/black_pawn_capture_move_generator'
require_relative 'generators/white_pawn_capture_move_generator'
require_relative 'generators/black_pawn_peace_move_generator'
require_relative 'generators/white_pawn_peace_move_generator'
require_relative 'generators/king_move_generator'
require_relative 'generators/blank_generator'
require_relative 'generators/castling_generator'
require_relative 'white_side'
require_relative 'generators/kingside_castling_generator'
require_relative 'analyst'
require_relative 'controller'
require_relative 'moves/move'
require_relative 'moves/castling_move'
