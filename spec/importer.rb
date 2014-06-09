shared_examples_for "Importer" do
  it 'has the right static methods' do
    expect(described_class).to respond_to :count
    expect(described_class).to respond_to :table_name
    expect(described_class).to respond_to :transaction
  end

  it {should respond_to(:object)}
  it {should respond_to(:read_row)}
end
