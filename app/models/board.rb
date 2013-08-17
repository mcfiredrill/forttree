class Board < ActiveRecord::Base
  has_many :branches
  has_attached_file :banner
end
