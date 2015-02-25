require 'spec_helper'
require 'csv'
require 'importer'

describe CnpMeasurementImporter do
  it_behaves_like 'Importer'

  it 'can read CSV' do
    leaf_part = set_up_leaf_part('SPD-01', 'T541', 'B1S', 'L5', 'L0S', 1)
    values = CSV.parse_line 'PERU,T541,Licania,brittoniana Fritsch,SPD01-T541-B1S-L5,SPD01-T541-B1S-L5,PERU,A,1,49.4,g,1.4,g,36.3,g,-3.3,g,-27.7,g,CN_2013_PERU_1_RESULTS,Peru,SPD01-T541-B1S-L5,0.0782,0.0511,g,P_2013_Peru_1,1'
    importer = CnpMeasurementImporter.new(1, 2)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)
    cnp = importer.object.reload
    expect(cnp.leaf_part).to eq(leaf_part)
    expect(cnp.original_cn_leafcode).to eq('SPD01-T541-B1S-L5')
    expect(cnp.c_percent).to eq(49.4)
    expect(cnp.c_percent_quality).to eq('g')
    expect(cnp.n_percent).to eq(1.4)
    expect(cnp.n_percent_quality).to eq('g')
    expect(cnp.cn_ratio).to eq(36.3)
    expect(cnp.cn_ration_quality).to eq('g')
    expect(cnp.n15_delta).to eq(-3.3)
    expect(cnp.n15_delta_quality).to eq('g')
    expect(cnp.c13_delta).to eq(-27.7)
    expect(cnp.c13_delta_quality).to eq('g')
    expect(cnp.cn_assays_file).to eq('CN_2013_PERU_1_RESULTS')
    expect(cnp.original_P_leafcode).to eq('SPD01-T541-B1S-L5')
    expect(cnp.p_corrected_percent).to eq(0.0782)
    expect(cnp.p_corrected_percent_cv).to eq(0.0511)
    expect(cnp.p_corrected_percent_quality).to eq('g')
    expect(cnp.p_assays_file).to eq('P_2013_Peru_1')
    expect(cnp).to be_valid
  end
end
