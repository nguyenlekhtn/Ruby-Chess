shared_examples 'has piece interface' do
  it 'responds to validators_class' do
    expect(subject).to respond_to(:validators_class)
  end

  it 'responds to to_s' do
    expect(subject).to respond_to(:to_s)
  end

  it 'responds to neighbor_generator' do
    expect(subject).to respond_to(:neighbor_generator).with(1).argument
  end
end
