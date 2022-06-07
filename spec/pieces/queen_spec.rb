require_relative '../../lib/library'
require_relative '../piece_interface_spec'

describe Queen do
  let(:board) { double('board') }
  subject(:piece) { described_class.new(board, Color::WHITE) }

  context 'when Queen is a child of Piece' do
    include_examples 'has piece interface'
  end
end