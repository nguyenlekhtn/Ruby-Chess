# frozen_string_literal: true

require_relative '../../lib/library'
require_relative '../piece_interface_spec'

describe BlackPawn do
  subject(:piece) { described_class.new }

  let(:board) { instance_double(Board) }

  context 'when BlackPawn is a child of Piece' do
    include_examples 'has piece interface'
  end
end
