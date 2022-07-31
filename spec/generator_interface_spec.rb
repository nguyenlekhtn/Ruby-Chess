shared_examples 'implement the generator interface' do
  it 'responds to cells' do
    expect(subject).to respond_to(:cells).with(1).arguments
  end

  it 'responds to moves' do
    expect(subject).to respond_to(:moves).with(1).arguments
  end

  it 'responds to move_piece' do
    expect(subject).to respond_to(:move_piece).with(2).arguments
  end
end
