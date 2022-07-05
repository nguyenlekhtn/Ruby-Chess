shared_examples 'implement the generator interface' do
  it 'responds to cells' do
    expect(subject).to respond_to(:cells).with(1).arguments
  end
end