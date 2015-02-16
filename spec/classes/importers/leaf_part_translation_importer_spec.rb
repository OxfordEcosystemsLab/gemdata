require 'spec_helper'
require 'csv'
require 'importer'

describe LeafPartTranslationImporter do
  it_behaves_like 'Importer'

  it 'can read CSV' do
    values = CSV.parse_line 'C1,L,1,C'
    importer = LeafPartTranslationImporter.new(1, 1)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)
    pt = importer.object.reload
    expect(pt.original_suffix).to eq('C1')
    expect(pt.part).to eq('L')
    expect(pt.subsection).to eq(1)
    expect(pt.simple_or_compound).to eq('C')
  end

  it 'can read CSV with a blank original code' do
    values = CSV.parse_line ',L,1,S'
    importer = LeafPartTranslationImporter.new(1, 1)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)
    pt = importer.object.reload
    expect(pt.original_suffix).to eq('')
    expect(pt.part).to eq('L')
    expect(pt.subsection).to eq(1)
    expect(pt.simple_or_compound).to eq('S')
  end

end
