# These need to go into gems:
#       http://guides.rubygems.org/
#       http://charlotte-ruby.github.com/gem_workshop_tutorial/

# Allow the defining of lookup values
ActiveRecord::Base.extend Lookups

# Setting of values on instantiation
ActiveRecord::Base.extend DefaultValues
