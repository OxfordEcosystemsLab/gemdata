shared_examples_for "Importer" do
  it 'has the right static methods' do
    expect(described_class).to respond_to :count
    expect(described_class).to respond_to :table_name
    expect(described_class).to respond_to :table_human_name
    expect(described_class).to respond_to :transaction
    expect(described_class).to respond_to :handler_class
    expect(described_class).to respond_to(:new).with(2).arguments
  end

  let (:instance) { described_class.new(1, 2) }

  it 'has instance methods too' do
    expect(instance).to respond_to :object
    expect(instance).to respond_to :read_row
  end
end
