# frozen_string_literal: true

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
      half_move = HalfMove.new(game)
      move_result = half_move.play
      case move_result
      when :checkmated
        puts "Player #{game.active_color.opposite.upcase} won. Game ended"
        return
      when :stalemated
        puts "Player #{game.active_color.upcase} cant make any move. Game draw"
        return
      end
      game.switch_active_color
    end
  end

  def start_game
    puts "Welcome to chess game"
    game_state = load
    if game_state.nil?
      puts "Loading save failed. Creating new game"
      @game = Game.new
    else
      put "Loading save successfuling"
      @game = game_state
    end

    play
  end

end
