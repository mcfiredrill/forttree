require 'test_helper'

class LeafsControllerTest < ActionController::TestCase
  context "a leafs controller" do
    setup do
      @branch = Factory.create :branch
      @leaf = @branch.leafs.first
    end

    should "get new" do
      get :new, :id => @branch.id
      assert_response :success
    end

    should "create leaf" do
      assert_difference('Leaf.count') do
        post :create, :branch_id => @branch.id, :leaf => @leaf.attributes
      end

      assert_redirected_to new_branch_path
    end
  end
end
