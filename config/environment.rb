# Load the rails application.
require File.expand_path('../application', __FILE__)

# Initialize the rails application.
Gemdata::Application.initialize!

# require 'latin'
ActiveSupport::Inflector.inflections do |inflect|
  inflect.irregular 'genus', 'genera'
  inflect.irregular 'leaf', 'leaves'
  inflect.irregular 'species', 'species'
end
