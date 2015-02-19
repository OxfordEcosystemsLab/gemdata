require 'spec_helper'
require 'csv'
require 'importer'

describe WoodDensityImporter do
  it_behaves_like 'Importer'

  it 'can read CSV' do
    @branch = set_up_branch('WAY-01', 'T812', 'B1S')
    values = CSV.parse_line 'Wayqecha,28/04/2013,Flor María y Yovana ,WAY01-CSP28009-812-SUN,WAY01-CSP28009-812-SUN,CC1,3.94,2.78,0.71,'
    importer = WoodDensityImporter.new(1, 2)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)
    wood = importer.object.reload
    expect(wood.branch).to eq(@branch)
    expect(wood.date).to eq(Date.new(2013,04,28))
    expect(wood.evaluator).to eq('Flor María y Yovana')
    expect(wood.original_code).to eq('WAY01-CSP28009-812-SUN')
    expect(wood.branch_type).to eq('CC1')
    expect(wood.fresh_volume_cm3).to eq(3.94)
    expect(wood.dry_mass).to eq(2.78)
    expect(wood.density_gcm3).to eq(0.71)
    expect(wood.comment).to eq(nil)
    expect(wood).to be_valid
  end

  it 'performs validation' do
    @branch = set_up_branch('WAY-01', 'T812', 'B1S')
    values = CSV.parse_line 'Wayqecha,28/04/2013,Flor María y Yovana ,WAY01-CSP28009-812-SUN,WAY01-CSP28009-812-SUN,X,,,0.71,'
    expect{importer.read_row(values, Array.new)}.to raise_error
  end

end
