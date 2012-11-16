require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  context "an admin" do
    setup do 
      @admin = create :admin
    end
    should "authenticate admin" do
      assert_equal Admin.authenticate('REALLYCOOLPASSWORD'), @admin
    end
  end
end
