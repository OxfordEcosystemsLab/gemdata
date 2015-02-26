require 'spec_helper'

describe SpecificLeafArea do

  before :each do
    @sla = SpecificLeafArea.new
    @sla.leaf = Leaf.new
    @sla.lamina_area = 3.1415926
    @sla.lamina_drymass = 3.1415926
    @sla.laminapetiole_area = 3.1415926
    @sla.laminapetiole_drymass = 3.1415926
    @sla.sla_lamina = 3.1415926
    @sla.sla_lamina_petiole = 3.1415926
    @sla.lma_lamina = 3.1415926
    @sla.lma_lamina_petiole = 3.1415926
    @sla.quality_flag = 'g'
    @sla.batch = Batch.new
  end

  it 'is not valid on its own' do
    expect(LeafArea.new).to_not be_valid
  end

  it 'can be valid' do
    expect(@sla).to be_valid
  end

  it 'it should not be valid without a leaf' do
    @sla.leaf = nil
    expect(@sla).to_not be_valid
  end

  it 'it should not be valid with a bad quality flag' do
    @sla.quality_flag = 'quetzalcoatlus'
    expect(@sla).to_not be_valid
  end

end
