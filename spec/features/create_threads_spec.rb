require 'spec_helper'

describe "A visitor" do
  before :each do
    @board = create :board
  end
  it "creates a new post" do
    name = "anon"
    content = "hi im making a post"
    image = "#{::Rails.root.to_s}/spec/fixtures/forttree.png"

    visit board_path @board
    fill_in "leaf[name]", with: name
    fill_in "leaf[content]", with: content
    attach_file "leaf[photo]", image
    click_button 'Post'
    page.should have_content 'Branch created!'
    page.should have_content name
    page.should have_content content
    page.should have_xpath "//img[contains(@src,\"#{File.basename(image)}\")]"
  end
end
