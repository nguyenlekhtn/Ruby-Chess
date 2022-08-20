# frozen_string_literal: true

require_relative '../../lib/library'
require_relative '../piece_interface_spec'

describe WhitePawn do
  subject(:piece) { described_class.new }

  let(:board) { instance_double(Board) }

  context 'when WhitePawn is a child of Piece' do
    include_examples 'has piece interface'
  end
end
