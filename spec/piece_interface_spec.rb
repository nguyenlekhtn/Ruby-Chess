shared_examples 'has piece interface' do
  it 'responds to piece_notation' do
    expect(subject).to respond_to(:type_notation)
  end

  it 'responds to to_s' do
    expect(subject).to respond_to(:to_s)
  end

  it 'responds to neighbor_generator' do
    expect(subject).to respond_to(:neighbor_generator).with(1).argument
  end
end
