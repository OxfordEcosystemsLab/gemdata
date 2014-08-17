require 'spec_helper'
require 'csv'
require 'importer'

describe CnpMeasurementImporter do
  it_behaves_like 'Importer'

  before :each do
    @leaf = set_up_leaf('SPD01', 'T541', 'B1S', 'L5', 1)
  end

  it 'can read CSV' do
    values = CSV.parse_line 'PERU,T541,Licania,brittoniana Fritsch,SPD01-T541-B1S-L5,PERU,A,1,49.4,1.4,36.3,-3.3,-27.7,CN_2013_PERU_1_RESULTS,Peru,SPD01-T541-B1S-L5,0.0782,0.0511,P_2013_Peru_1,1'

    importer = CnpMeasurementImporter.new(1, 2)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)

    cnp = importer.object.reload
    expect(cnp.leaf).to eq(@leaf)
    expect(cnp.row).to eq('A')
    expect(cnp.column).to eq(1)
    expect(cnp.c_percent).to eq(49.4)
    expect(cnp.n_percent).to eq(1.4)
    expect(cnp.cn_ratio ).to eq(36.3)
    expect(cnp.n15_delta).to eq(-3.3)
    expect(cnp.n13_delta).to eq(-27.7)
    expect(cnp.cn_assays_file).to eq('CN_2013_PERU_1_RESULTS')
    expect(cnp.p_corrected_avg).to eq(0.0782)
    expect(cnp.p_corrected_var_coef).to eq(0.0511)
    expect(cnp.p_assays_file).to eq('P_2013_Peru_1')
    expect(cnp.box_number).to eq(1)
    expect(cnp.batch_id).to eq(1)

    expect(cnp).to be_valid
  end
end
