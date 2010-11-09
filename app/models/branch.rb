class Branch < ActiveRecord::Base
    has_many :leafs, :dependent => :destroy

    accepts_nested_attributes_for :leafs
end
