require 'spec_helper'
require 'csv'
require 'importer'

describe LeafRepellencyImporter do
  it_behaves_like 'Importer'

  before :each do
    @branch = set_up_branch('PAN-02', 'T49', 'B4S')
  end

  it 'can read CSV with leaf code L' do
    values = CSV.parse_line '236,595,PAN02-T49-B4S-H,PAN02,T49,B4S,PAN02-T49,,L1,3818,PAN02-T49,Fabaceae,Inga,alba,Ingaalba,86.11,x,"""A"" on code; cannot resolve identification"'
    importer = LeafRepellencyImporter.new(1, 2)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)
    lr = importer.object.reload
    expect(lr.branch).to eq(@branch)
    expect(lr.replica).to eq('L1')
    expect(lr.photo_number).to eq(3818)
    expect(lr.angle).to eq(86.11)
    expect(lr.angle_exclude).to eq('X')
    expect(lr.angle_comments).to eq('"A" on code; cannot resolve identification')
    expect(lr).to be_valid
  end

  it 'can read CSV with a space in the plot code' do
    values = CSV.parse_line '236,595,PAN 02-T49-B4S-H,PAN02,T49,B4S,PAN02-T49,,L1,3818,PAN02-T49,Fabaceae,Inga,alba,Ingaalba,86.11,x,"""A"" on code; cannot resolve identification"'
    importer = LeafRepellencyImporter.new(1, 2)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)
    lr = importer.object.reload
    expect(lr.branch).to eq(@branch)
    expect(lr).to be_valid
  end

end
