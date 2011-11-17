require 'test_helper'

class BranchesControllerTest < ActionController::TestCase
  context "a branches controller" do
    setup do
      @branch = Factory.create :branch
    end

    should "get new" do
      get :new
      assert_response :success
    end

    should "create branch" do
      assert_difference('Branch.count', 1) do
        post :create, :leaf => {:content => @branch.leafs.first.content}
      end

      assert_redirected_to new_branch_path
    end

    should "destroy branch" do
      @admin = Factory.create :admin
      assert_difference('Branch.count', -1) do
        delete :destroy, :delete => [@branch.leafs.first.id], :password => @admin.password, :id => "new"
      end

      assert_redirected_to new_branch_path
    end
  end
end
