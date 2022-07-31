shared_examples 'implement the generator interface' do
  it 'responds to cells' do
    expect(subject).to respond_to(:cells).with(1).arguments
  end

  it 'responds to moves' do
    expect(subject).to respond_to(:moves).with(1).arguments
  end
end
