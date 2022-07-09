require_relative '../../lib/library'
require_relative '../validator_interface_spec'

describe VerticalValidator do
  let(:board) { instance_double(Board) }
  subject(:validator) { described_class.new(board) }

  context 'when VerticalValidator is a child of Validator' do
    include_examples 'has validator interface'
  end
end
