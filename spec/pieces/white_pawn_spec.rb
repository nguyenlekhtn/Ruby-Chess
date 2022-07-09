require_relative '../../lib/library'
require_relative '../piece_interface_spec'

describe WhitePawn do
  let(:board) { double('board') }
  subject(:piece) { described_class.new }

  context 'when WhitePawn is a child of Piece' do
    include_examples 'has piece interface'
  end
end
