require 'spec_helper'

describe "A visitor" do
  it "creates a new post" do
    name = "anon"
    content = "hi im making a post"
    image = "#{::Rails.root.to_s}/spec/fixtures/forttree.png"

    visit new_branch_path
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
