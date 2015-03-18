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
    expect(page).to have_content 'Leaf created!'
    expect(page).to have_content name
    expect(page).to have_content content
    expect(page).to have_xpath "//img[contains(@src,\"#{File.basename(image)}\")]"
  end
end
