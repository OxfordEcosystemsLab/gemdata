require "rake"

RSpec.configure do |config|
  config.after :all do
    Gemdata::Application.load_tasks
    Rake::Task['db:reset'].invoke
  end
end
