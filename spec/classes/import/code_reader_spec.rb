require "spec_helper"

describe CodeReader do

  def expect_to_read(code)
    expect{CodeReader.new code}.to_not raise_error
  end

  def expect_to_not_read(code)
    expect{CodeReader.new code}.to raise_error
  end

  it 'can read a T code' do
    expect_to_read "WAY01-T1031-B1S"
  end

  it 'can read a CSP code' do
    expect_to_read "WAY01-CSP28003-77-S"
  end

  it 'raises an exception on invalid code' do
    expect_to_not_read "What's all this? What's all this?"
  end

  it 'should be consistent' do
    create_test_tree("WAY01", "T1031")
    reader = CodeReader.new "WAY01-T1031-B1S"
    branch = reader.find_or_create_branch
    expect(reader.find_or_create_branch).to eq(branch)
  end

  it 'raises exceptions when records are not available' do
    reader = CodeReader.new "WAY01-T1031-B1S"
    expect{reader.find_or_create_branch}.to raise_error(ActiveRecord::RecordNotFound)
    create_test_tree('WAY01', 'T1031')
    expect{reader.find_or_create_branch}.to_not raise_error
  end

  it 'knows which sub plot to use'

  private
    def create_test_tree(plot_code, tree_code)
      plot = Plot.create!(:plot_code => plot_code)
      sub_plot = SubPlot.create!(:plot_id => plot.id)
      fp_species = FpSpecies.new
      tree = Tree.create!(:tree_code => tree_code, :sub_plot_id => sub_plot.id, :fp_species => fp_species)
    end
end
