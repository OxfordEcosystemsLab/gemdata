require 'spec_helper'
require 'exceptions'

class FakeImporter < RowImporter

  def self.table_name
    'test'
  end

  def self.ar_class
    Tree
  end

  def read_row(values, logger)
    Lookup::ImportStatus.inserted
  end
end

describe BaseCsvHandler do

  before :each do
    @output = Array.new
  end

  it 'can filter' do
    filtered = ['aaa', 'bbb'].select{|x| x.include? 'a' }
    expect(filtered.size).to eq(1)
  end

  it 'can do a UTF-8 import' do
    handler = handler_for_file('utf-8.csv')
    thread = handler.import!
    thread.join
    expect(has_success_message).to be_true
  end
 
  it 'can do an ISO western import' do
    handler = handler_for_file('iso-western.csv')
    thread = handler.import!
    thread.join
    expect(has_success_message).to be_true
  end

  it 'does not trip up on dodgy characters' do
    handler = handler_for_file('dodgy.csv')
    thread = handler.import!
    thread.join
    expect(has_success_message).to be_true
  end

  private
    def handler_for_file(filename)
      BaseCsvHandler.new(FakeImporter, "#{Rails.root}/spec/fixtures/#{filename}", @output)
    end

    def has_success_message
      yes = @output.select{|x| x.include? 'Import complete'}.length == 1
      puts @output unless yes
      yes
    end

end
