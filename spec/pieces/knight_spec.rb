# frozen_string_literal: true

require_relative '../../lib/library'
require_relative '../piece_interface_spec'

describe Knight do
  subject(:piece) { described_class.new(Color::WHITE) }

  let(:board) { instance_double(Board) }

  context 'when Knight is a child of Piece' do
    include_examples 'has piece interface'
  end
end
