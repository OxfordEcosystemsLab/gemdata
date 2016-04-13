require 'spec_helper'
require 'csv'
require 'importer'

describe TestImporter do 
  it_behaves_like 'Importer'
  
it 'can read CSV' do

    values = CSV.parse_line '1,ABCDEFG'
    
    importer = TestImporter.new(1, 2)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)
    
    b = importer.object.reload
    expect(b).to be_valid
    expect(b.name).to eq('1')
    expect(b.data).to eq('ABCDEFG')
  end
end
  