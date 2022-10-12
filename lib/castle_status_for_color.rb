# frozen_string_literal: true

class CastleStatusForColor
  attr_reader :color, :castle_avail

  def initialize(**opts)
    @color = opts[:color]
    @castle_avail = opts[:castle_avail] || { 'Q' => true, 'K' => true }
  end

  def able_to_castle?(is_kingside)
    king_not_moved? && rook_not_moved?(is_kingside)
  end

  def able_to_castle_at_side?(is_kingside)
    @castle_avail[side(is_kingside)]
  end

  def mark_rook_moved(is_kingside)
    @castle_avail[side(is_kingside)] = false
    self.class.new(color:, castle_avail: { **@castle_avail, side(is_kingside) => false })
  end

  def mark_king_moved
    self.class.new(color:, castle_avail: { 'Q' => false, 'K' => false })
  end

  def side(is_kingside)
    return 'K' if is_kingside

    'Q'
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'color' => @color,
      'castle_avail' => @castle_avail
    }.to_json(*args)
  end

  def self.json_create(object)
    new(color: object['color'], castle_avail: object['castle_avail'])
  end

  def eql?(other)
    other.class == self.class && other.color == @color && other.castle_avail == @castle_avail
  end

  def to_notation
    return castle_avail_notation if color == Color::WHITE

    castle_avail_notation.downcase
  end

  def castle_avail_notation
    %w[K Q].map { |key| castle_avail[key] == true ? key : '' }.join
  end

  alias == eql?
end
