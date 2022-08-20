# frozen_string_literal: true

require_relative '../../lib/library'
require_relative '../piece_interface_spec'

describe Rook do
  subject(:piece) { described_class.new(Color::WHITE) }

  let(:board) { double('board') }

  context 'when Rook is a child of Piece' do
    include_examples 'has piece interface'
  end
end
