require "spec_helper"
require 'exceptions'

describe CodeReader do

  def expect_to_read(code)
    expect{CodeReader.new code}.to_not raise_error
  end

  def expect_to_not_read(code)
    expect{CodeReader.new code}.to raise_error
  end

  it 'can tidy a plot code' do
    expect(CodeReader.tidy_plot_code('WAY1')).to eq('WAY-01')
  end

  it 'can read a T code' do
    expect_to_read "WAY01-T1031-B1S"
  end

  it 'can read a T code  with a hyphen in the plot code' do
    expect_to_read "WAY-01-T1031-B1S"
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
    expect_to_read 'WAY-01-T1031'
    expect_to_read 'WAY-01-T78'
    expect_to_read 'TAM-05-T300'
    reader = CodeReader.new 'WAY-01-T1031'
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
  
  it 'can read a tree code ending in "A"' do
    reader = CodeReader.new 'TAM06-T404A-B11H-L1C1'
    expect(reader.tree_code).to eq('T404A')
    expect(reader.branch_code).to eq('B11H')
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

  it 'can read a leaf part' do
    # Are we going to see any codes in this format?
    #reader = CodeReader.new 'WAY01-T1031-B25H-L1P-130822.-OX'
    reader = CodeReader.new 'WAY01-T1031-B25H-L1C2'
    expect(reader.leaf_part).to eq('C2')
  end

  it 'can read a leaf part with a hyphen in the plot code' do
    reader = CodeReader.new 'WAY-01-T1031-B25H-L1C2'
    expect(reader.leaf_part).to eq('C2')
  end

  it 'can read a hyphenated plot code the same as an ordinary plot code' do
    hyphenated = CodeReader.new 'WAY-1-T1031-B25H-L1C2'
    plain = CodeReader.new 'WAY1-T1031-B25H-L1C2'
    expect(hyphenated.plot_code).to eq(plain.plot_code)
  end

  it 'can read a space separated plot code the same as an ordinary plot code' do
    hyphenated = CodeReader.new 'WAY 1-T1031-B25H-L1C2'
    plain = CodeReader.new 'WAY1-T1031-B25H-L1C2'
    expect(hyphenated.plot_code).to eq(plain.plot_code)
  end

  it 'can read the "strange" code from the Carnegie data' do
    reader = CodeReader.new 'WAY-01-T1050.2A-B1S'
    expect(reader.plot_code).to eq('WAY-01')
    expect(reader.tree_code).to eq('T1050.2A')
    expect(reader.branch_code).to eq('B1S')
  end

  it 'can read a hyphenated CSP code from branch architecture' do
    CspTranslation.create!(:csp_code => 'CSP28002', :tree_code => 'T32', :branch_code => 'B11H')
    reader = CodeReader.new 'WAY01-CSP-28002-32-H'
    expect(reader.plot_code).to eq('WAY-01')
    expect(reader.tree_code).to eq('T32')
    expect(reader.branch_code).to eq('B11H')
  end

  it 'can read a CSP code with a hyphenated plot code' do
    CspTranslation.create!(:csp_code => 'CSP28002', :tree_code => 'T32', :branch_code => 'B11H')
    reader = CodeReader.new 'WAY-01-CSP-28002-32-H'
    expect(reader.plot_code).to eq('WAY-01')
    expect(reader.tree_code).to eq('T32')
    expect(reader.branch_code).to eq('B11H')
  end

  it 'can read the code from the photosynthesis test' do
    reader = CodeReader.new 'WAY01-T1031-B25H-L1C2'
    expect(reader.plot_code).to eq('WAY-01')
    expect(reader.tree_code).to eq('T1031')
    expect(reader.branch_code).to eq('B25H')
    expect(reader.leaf_code).to eq('L1')
    expect(reader.leaf_part).to eq('C2')
  end

  it 'can read the code from the veins test' do
    reader = CodeReader.new 'ACJ01-I2014-B1S-L1S'
    expect(reader.plot_code).to eq('ACJ-01')
    expect(reader.tree_code).to eq('I2014')
    expect(reader.branch_code).to eq('B1S')
    expect(reader.leaf_code).to eq('L1')
    expect(reader.leaf_part).to eq('S')
  end

  it 'can read a code with underscores' do
    reader = CodeReader.new 'ACJ01_I2014'
    expect(reader.plot_code).to eq('ACJ-01')
    expect(reader.tree_code).to eq('I2014')
  end

  it 'can read a hyphenated tree code' do
    reader = CodeReader.new 'WAY01-T1050-2A-B1S-L1S'
    expect(reader.plot_code).to eq('WAY-01')
    expect(reader.tree_code).to eq('T10502A')
    expect(reader.branch_code).to eq('B1S')
    expect(reader.leaf_code).to eq('L1')
    expect(reader.leaf_part).to eq('S')
  end

  it 'can translate an Arizona leaf part code' do
    LeafPartTranslation.new do |lt|
      lt.ar_class = 'LeafPartCharacteristics'
      lt.original_suffix = 'S'
      lt.part = 'L'
      lt.subsection = 0
      lt.simple_or_compound = 'S'
      lt.batch_id = 1
      lt.save
    end
    reader = CodeReader.new('WAY01-T1050-2A-B1S-L1S', 'LeafPartCharacteristics')
    expect(reader.leaf_part).to eq('L0S')
  end

  it 'can translate the strange codes from the characteristics data' do
    reader = CodeReader.new('ESP01-T238-B1S-L1', 'LeafPartCharacteristics')
    expect(reader.leaf_part).to eq('L0S')
  end

  it 'can translate CSP codes with repeated tree/branch codes' do
    reader = CodeReader.new('WAY01-CSP28003-77-SUN-L1L', '')
    expect(reader.plot_code).to eq('WAY-01')
    expect(reader.tree_code).to eq('T77')
    expect(reader.branch_code).to eq('B1S')
    expect(reader.leaf_code).to eq('L1')
    expect(reader.leaf_part).to eq('L')
  end

  it 'can translate CSP codes with a repeated branch code' do
    reader = CodeReader.new('WAY01-CSP28003-SUN-L1L', '')
    expect(reader.plot_code).to eq('WAY-01')
    expect(reader.tree_code).to eq('T77')
    expect(reader.branch_code).to eq('B1S')
    expect(reader.leaf_code).to eq('L1')
    expect(reader.leaf_part).to eq('L')
  end

  it 'can translate CSP codes with a repeated T-prefixed tree code' do
    reader = CodeReader.new('WAY01-CSP28042-T889-B2H-L1L', '')
    expect(reader.plot_code).to eq('WAY-01')
    expect(reader.tree_code).to eq('T889')
    # note - it ignores the redundent branch code and uses
    # what CSP says the branch is
    expect(reader.branch_code).to eq('B1S')
    expect(reader.leaf_code).to eq('L1')
    expect(reader.leaf_part).to eq('L')
  end

  it 'can read a code with no prefix on the tree' do
    reader = CodeReader.new 'WAY01-1031-B25H-L1C2'
    expect(reader.plot_code).to eq('WAY-01')
    expect(reader.tree_code).to eq('T1031')
    expect(reader.branch_code).to eq('B25H')
    expect(reader.leaf_code).to eq('L1')
    expect(reader.leaf_part).to eq('C2')
  end

  it 'can read codes from Branch Leaf Mass' do
    reader = CodeReader.new 'ACJ01-T846-B11H-Ar'
    expect(reader.plot_code).to eq('ACJ-01')
    expect(reader.tree_code).to eq('T846')
    expect(reader.branch_code).to eq('B11H')
  end

end
