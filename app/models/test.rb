class test < ActiveRecord::Base
   include BatchImport
   
   include CSVImportTable
   
   include ValidatePlotAndDate
   include ValidateTreeTag
  
   require 'csv'
   CSV.foreach(file.path, headers: true) do |row|
    test.create! row.to_hash
  end
end
  
end