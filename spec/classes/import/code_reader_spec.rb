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

  it 'can read a T code  with a hyphen in the plot code' do
    expect_to_read "WAY-01-T1031-B1S"
  end
  
  it 'can read a CSP code' do
    expect_to_read "WAY01-CSP28003-77-S"
  end

  it 'can read a CSP code with a hyphen in the plot code' do
    expect_to_read "WAY-01-CSP28003-77-S"
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

  it 'can read just a tree with a hyphen in the plot code' do
    expect_to_read 'WAY01-T1031'
    expect_to_read 'WAY01-T78'
    expect_to_read 'TAM05-T300'
    reader = CodeReader.new 'WAY01-T1031'
    expect(reader.tree_code).to eq('T1031')
  end

  it 'can tidy a poorly formatted plot code' do
    reader = CodeReader.new 'WAY1-T1031'
    expect(reader.plot_code).to eq('WAY-01')
  end

  it 'can tidy a poorly formatted, hyphenated plot code' do
    reader = CodeReader.new 'WAY-1-T1031'
    expect(reader.plot_code).to eq('WAY-01')
  end

  it 'can read a complex tree code' do
    expect_to_read 'ESP01-T641.1-B1S-L4'
    reader = CodeReader.new 'ESP01-T641.1-B1S-L4'
    expect(reader.tree_code).to eq('T641.1')
  end

  it 'can read a complex tree code with a hyphen in the plot code' do
    expect_to_read 'ESP-01-T641.1-B1S-L4'
    reader = CodeReader.new 'ESP01-T641.1-B1S-L4'
    expect(reader.tree_code).to eq('T641.1')
  end
  
  it 'can read a leaf code' do
    # Are we going to see any codes in this format?
    #reader = CodeReader.new 'WAY01-T1031-B14-L45-45252'
    reader = CodeReader.new 'WAY01-T1031-B14-L45C2'
    expect(reader.leaf_code).to eq('L45')
  end

  it 'can read a leaf code with a hyphen in the plot code' do
    reader = CodeReader.new 'WAY-01-T1031-B14-L45C2'
    expect(reader.leaf_code).to eq('L45')
  end

  it 'can read a suffix' do
    # Are we going to see any codes in this format?
    #reader = CodeReader.new 'WAY01-T1031-B25H-L1P-130822.-OX'
    reader = CodeReader.new 'WAY01-T1031-B25H-L1C2'
    expect(reader.suffix).to eq('C2')
  end

  it 'can read a suffix with a hyphen in the plot code' do
    reader = CodeReader.new 'WAY-01-T1031-B25H-L1C2'
    expect(reader.suffix).to eq('C2')
  end

  it 'can read a hyphenated plot code the same as an ordinary plot code' do
    hyphenated = CodeReader.new 'WAY-1-T1031-B25H-L1C2'
    plain = CodeReader.new 'WAY1-T1031-B25H-L1C2'
    expect(hyphenated.plot_code).to eq(plain.plot_code)
  end

end
