require 'spec_helper'

describe "DeletePostsTests" do
  before(:each) do
    @admin = create :admin
    @branch = create :branch
  end
  it "should delete a branch and all the leafs" do
    visit "/"
    check "delete_#{@branch.leafs.first.id}" 
    fill_in "password", :with => @admin.password
    click_button "Delete"
    response.status.should be(200)
    assert_nil @branch
  end
  it "should delete just one leaf" do
    @leaf = create :leaf, :branch_id => @branch.id
    visit "/"
    check "delete_#{@leaf.id}" 
    fill_in "password", :with => @admin.password
    click_button "Delete"
    response.status.should be(200)
    assert_nil @leaf
    assert_not_nil @branch
    assert_not_nil @branch.leafs.first
  end
  it "should not delete branch with wrong password" do
    visit "/"
    check "delete_#{@branch.leafs.first.id}" 
    fill_in "password", :with => "WRONGPASSWORD"
    click_button "Delete"
    response.status.should be(200)
    assert_not_nil @branch
    assert_not_nil @branch.leafs.first
  end
end
