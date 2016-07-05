module BatchImport
  extend ActiveSupport::Concern

  included do
    belongs_to :batch
    validates  :batch, :presence => true
  end

  def can_overwrite(current_batch_id, overwrite_batch_id)
    new_record? or batch_id.nil? or batch_id == current_batch_id or batch_id == overwrite_batch_id
  end

  module ClassMethods

    def batch_find_or_initialize_by(batch_id, params)
      self.find_or_initialize_by(params) do |new_object|
        new_object.batch_id = batch_id
      end
    end

    def batch_find_or_create_by!(batch_id, params)
      self.find_or_create_by!(params) do |new_object|
        update_batch_as_duplicate(batch_id, params)
        new_object.batch_id = batch_id
      end
    end

    def update_batch_as_duplicate(batch_id, params)
      updated_object = use_batch_from_association(params)
      if updated_object.try(:batch_id).present? && updated_object.try(:batch_id) != batch_id
        batch_object = Batch.find(batch_id)
        batch_object.update(duplicate:  true) if batch_object.duplicate == false
      end
    end

    def use_batch_from_association(params)
      if params[:plot_code].present? && params[:fp_id].present? 
         Plot.where(params).first 
       elsif params[:tree].present? 
         params[:tree]
       end
    end
 
  end 

end
