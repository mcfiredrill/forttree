class Branch < ActiveRecord::Base
  has_many :leafs, :dependent => :destroy
  belongs_to :board

  accepts_nested_attributes_for :leafs, :allow_destroy => true

  # pagination
  cattr_reader :per_page
  @@per_page = BRANCHES_PER_PAGE
  default_scope :order => 'updated_at DESC'

end
