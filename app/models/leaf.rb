class Leaf < ActiveRecord::Base
    belongs_to :branch

    has_attached_file :photo
end
