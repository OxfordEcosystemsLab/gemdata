shared_examples_for "Importer" do
  it 'has the right methods' do
    expect(described_class).to respond_to :count
    expect(described_class).to respond_to :table_human_name
    expect(described_class).to respond_to :table_name
    expect(described_class).to respond_to :transaction
  end
end
