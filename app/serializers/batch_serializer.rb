class BatchSerializer < ActiveModel::Serializer
  attributes :id, :import_address, :started, :finished, :transaction_passed
end
