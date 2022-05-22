shared_examples 'validator_interface' do
  it 'responds to valid?' do
    expect(subject).to respond_to?(:valid?)
  end
end