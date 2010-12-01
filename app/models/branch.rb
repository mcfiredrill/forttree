class Branch < ActiveRecord::Base
  has_many :leafs, :dependent => :destroy

  accepts_nested_attributes_for :leafs
  # pagination
  cattr_reader :per_page
  @@per_page = 5
  default_scope :order => 'last_post_at DESC'
end
