# frozen_string_literal: true

shared_examples 'implement the generator interface' do
  it 'responds to generate_moves' do
    expect(subject).to respond_to(:generate_moves).with(1).arguments
  end
end
