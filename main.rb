# frozen_string_literal: true

require_relative 'lib/library'

# Controller.new.play
# Controller.new(Game.new(board: Board.for('1k6/1p4R1/7R/1N6/8/8/8/K7'),
#                         color: Color::WHITE)).play

Controller.new.start_game
