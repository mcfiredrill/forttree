require 'spec_helper'

feature "DeletePosts" do
  before(:each) do
    @admin = create :admin
    @board = create :board
    @branch = @board.branches.first
  end
  scenario "should delete a branch and all the leafs" do
    visit board_path @board
    check "delete_#{@branch.leafs.first.id}"
    fill_in "password", :with => @admin.password
    click_button "Delete"
    page.should have_content 'Branch pruned!'
    expect(Branch.exists?(@branch)).to eq false
    expect(Leaf.exists?(@branch.leafs.first)).to eq false
  end
  scenario "should delete just one leaf" do
    @branch.leafs << create(:leaf)
    @leaf = @branch.leafs.first
    visit board_path @board
    check "delete_#{@leaf.id}"
    fill_in "password", :with => @admin.password
    click_button "Delete"
    page.should have_content 'Leaf pruned!'
    expect(Leaf.exists?(@leaf.id)).to eq false
    expect(Branch.exists?(@branch)).to eq true
    expect(Leaf.exists?(@branch.leafs.first)).to eq true
  end
  scenario "should not delete branch with wrong password" do
    visit board_path @board
    check "delete_#{@branch.leafs.first.id}"
    fill_in "password", :with => "WRONGPASSWORD"
    click_button "Delete"
    page.should have_content 'Incorrect password!'
    expect(Branch.exists?(@branch)).to eq true
    expect(Leaf.exists?(@branch.leafs.first)).to eq true
  end
end
