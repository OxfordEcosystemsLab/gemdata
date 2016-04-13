class Test < ActiveRecord::Base
  require 'csv'
  
   include BatchImport
   
   include CSVImportTable
   
   include ValidatePlotAndDate
   include ValidateTreeTag
  
  
  end
end
  
end