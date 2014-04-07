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
end
