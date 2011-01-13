class Branch < ActiveRecord::Base
  has_many :leafs, :dependent => :destroy

  accepts_nested_attributes_for :leafs

  # pagination
  cattr_reader :per_page
  @@per_page = BRANCHES_PER_PAGE
  default_scope :order => 'last_post_at DESC'

  #validates(:leafs, :presence => true)
end
