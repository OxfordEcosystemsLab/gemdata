require "spec_helper"
require 'exceptions'

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

  it 'can read just a tree' do
    expect_to_read 'WAY01-T1031'
    expect_to_read 'WAY01-T78'
    expect_to_read 'TAM05-T300'
    reader = CodeReader.new 'WAY01-T1031'
    expect(reader.tree_code).to eq('T1031')
  end

  it 'can read a leaf code' do
    reader = CodeReader.new 'WAY01-T1031-B14-L45-45252'
    expect(reader.leaf_code).to eq('L45')
  end

  it 'can read a suffix' do
    reader = CodeReader.new 'WAY01-T1031-B25H-L1P-130822.-OX'
    expect(reader.suffix).to eq('130822.-OX')
  end

end
