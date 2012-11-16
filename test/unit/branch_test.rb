require 'test_helper'

class BranchTest < ActiveSupport::TestCase
  should have_many :leafs
  context "a branch" do
    setup { @branch = create(:branch) }
  end
end
