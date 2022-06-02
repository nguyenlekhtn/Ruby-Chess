shared_examples 'has piece interface' do
  it 'responds to validators_class' do
    expect(subject).to respond_to(:validators_class)
  end
end
