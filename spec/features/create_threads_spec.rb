require 'spec_helper'
#include Rails.application.routes.url_helpers

feature "A visitor" do
  before :each do
    @board = create :board
  end
  scenario "creates a new post" do
    name = "anon"
    content = "hi im making a post"
    image = "#{::Rails.root.to_s}/spec/fixtures/forttree.png"

    visit board_path @board
    fill_in "test-name", with: name
    fill_in "test-content", with: content
    attach_file "test-photo", image
    click_button 'Post'
    page.should have_content 'Branch created!'
    page.should have_content name
    page.should have_content content
    page.should have_xpath "//img[contains(@src,\"#{File.basename(image)}\")]"
  end
end
