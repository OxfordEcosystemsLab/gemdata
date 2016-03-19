class EgmRespirationCollar < ActiveRecord::Base
  include BatchImport

  module Type
    SOIL = 'soil'
    STEM = 'stem'
    IC   = 'ic'
  end

  belongs_to :plot
  belongs_to :sub_plot
  belongs_to :tree

  validates :plot,              presence: true
  validates :collar_type,       presence: true, inclusion: { in: [ Type::SOIL,
                                                                   Type::STEM,
                                                                   Type::IC ] }
  validates :collar_num,        allow_nil: true,
                                format: { with: /\A[0-9]+\z/,
                                          message: "should be an integer." } 
  validates :plot_corner_code,  allow_nil: true,
                                format: { with: /\A[012345],[012345]\z/,
                                          message: "should be in format 'N,N' (no quotes) where N is 0 to 5" } 

end
