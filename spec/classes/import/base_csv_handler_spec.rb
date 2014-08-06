require 'spec_helper'
require 'exceptions'
require 'rspec/expectations'

class FakeImporter < RowImporter

  def self.table_name
    'test'
  end

  def self.ar_class
    Tree
  end

  def read_row(values, logger)
    Float values[0]
    Lookup::ImportStatus.inserted
  end
end

RSpec::Matchers.define :have_a_success_message do
  match do |actual|
    actual.select{|x| x.include? 'Import complete'}.length == 1
  end
  failure_message_for_should do |actual|
    "expected \n\n #{actual} \n\n to have a line that started with 'Import complete'"
  end
end

describe BaseCsvHandler do

  let(:logger) { Array.new }

  it 'can do a UTF-8 import' do
    import_file('utf-8.csv', logger)
    expect(logger).to have_a_success_message
  end

  it 'can do an ISO western import' do
    import_file('iso-western.csv', logger)
    expect(logger).to have_a_success_message
  end

  it 'does not trip up on dodgy characters' do
    import_file('dodgy.csv', logger)
    expect(logger).to have_a_success_message
  end

  it 'does not care about new lines outside of quotes' do
    import_file('new_lines.csv', logger)
    expect(logger).to have_a_success_message
  end

  private

    def import_file(filename, logger)
      handler = BaseCsvHandler.new(FakeImporter, "#{Rails.root}/spec/fixtures/#{filename}", logger, nil)
      thread = handler.import!
      thread.join
    end

    def success_messages
      @output.select{|x| x.include? 'Import complete'}
    end

end
