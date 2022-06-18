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
require_relative 'validator'
require_relative 'validators/segment_validator'
require_relative 'validators/horizontal_validator'
require_relative 'validators/vertical_validator'
require_relative 'validators/diagonal_validator'
require_relative 'validators/different_color_validator'
require_relative 'validators/knight_move_validator'
require_relative 'validators/king_move_validator'
require_relative 'validators/black_pawn_capture_move_validator'
require_relative 'validators/black_pawn_peace_move_validator'
require_relative 'validators/white_pawn_capture_move_validator'
require_relative 'validators/white_pawn_peace_move_validator'
