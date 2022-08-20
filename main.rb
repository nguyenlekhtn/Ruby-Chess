# frozen_string_literal: true

require_relative 'lib/library'

# Controller.new.play
Controller.new(Game.new(board: Board.for('rnbqk1nr/pppp2pp/3b1p2/4p3/4P3/3B1P2/PPPPN1PP/RNBQK2R'),
                        color: Color::BLACK)).play
