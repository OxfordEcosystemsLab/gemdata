require 'spec_helper'

describe Herbivory do

  before :each do
    leaf = set_up_leaf('ACJ', 'T802', 'B3S', 'HR1')

    @h = Herbivory.new
    @h.leaf = leaf
    @h.original_code = 'ACJ01-T802-B3S-HA-8'
    @h.date = Date.new(1966,4,1)
    @h.estimated_full_la = 23.236
    @h.observed_remaining_la = 11.52
    @h.consumed_la = 2.507
    @h.percent_consumed = 17.87267413
    @h.note = 'lickety split'
    @h.quality_flag = 'terrible'
    @h.batch_id = 1
  end

  it 'is not valid on its own' do
    expect(Herbivory.new).to_not be_valid
  end

  it 'can be valid' do
    expect(@h).to be_valid
  end
end

