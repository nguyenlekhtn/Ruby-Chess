# frozen_string_literal: true

require_relative './save_load'

class Controller
  include SaveLoad
  attr_reader :game

  def initialize(game = Game.new)
    @game = game
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
      half_move = HalfMove.new(game, self)
      move_result = half_move.play
      case move_result
      when :checkmated
        puts "Player #{game.active_color.opposite} won. Game ended"
        return
      when :stalemated
        puts "Player #{game.active_color} cant make any move. Game draw"
        return
      end
      game.switch_active_color
    end
  end

  def start_game
    puts 'Welcome to chess game'
    game_state = load
    @game = game_state || Game.new

    play
  end
end
