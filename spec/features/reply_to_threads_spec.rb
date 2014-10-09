require 'spec_helper'

feature "A visitor" do
  before(:each) do
    @board = create :board
  end
  scenario "replies to a post" do
    name = "anon"
    content = "hi im replying to a post"
    image = "#{::Rails.root.to_s}/spec/fixtures/forttree.png"

    visit board_path @board
    click_link "Reply"
    fill_in "test-name", with: name
    fill_in "test-content", with: content
    attach_file "test-photo", image
    click_button 'Post'
    page.should have_content 'Leaf created!'
    page.should have_content name
    page.should have_content content
    page.should have_xpath "//img[contains(@src,\"#{File.basename(image)}\")]"
  end
end
