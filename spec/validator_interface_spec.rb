shared_examples 'has validator interface' do
  it 'responds to valid?' do
    expect(subject).to respond_to(:valid?)
  end
end