class Branch < ActiveRecord::Base
    has_many :leafs, :dependent => :destroy
end
