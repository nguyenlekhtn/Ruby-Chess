shared_examples 'implement the generator interface' do
  it 'responds to cells' do
    expect(subject).to respond_to(:cells).with(1).arguments
  end

  it 'responds to generate_moves' do
    expect(subject).to respond_to(:generate_moves).with(1).arguments
  end

  it 'responds to generate_capturable_move?' do
    expect(subject).to respond_to(:generate_capturable_move?)
  end
end
