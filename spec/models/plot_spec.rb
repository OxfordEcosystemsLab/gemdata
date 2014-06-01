require 'spec_helper'

describe Plot do
  it 'requires a code' do
    plot = Plot.new
    expect(plot).to_not be_valid
    expect(plot).to have(1).errors_on(:plot_code)
    plot.plot_code = 'asdf'
    expect(plot).to be_valid
  end

  it 'removes a dash' do
    plot = Plot.create(:plot_code => 'WAY234')
    expect(plot.plot_code).to eq('WAY234')
  end
end
