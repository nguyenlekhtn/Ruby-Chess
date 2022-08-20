# frozen_string_literal: true

require_relative '../../lib/library'
require_relative '../piece_interface_spec'

describe Bishop do
  let(:board) { double('board') }
  subject(:piece) { described_class.new(Color::WHITE) }

  context 'when Bishop is a child of Piece' do
    include_examples 'has piece interface'
  end
end
