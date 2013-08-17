require 'spec_helper'

describe "board management" do
  before :each do
    @admin = create :admin
  end

  it "creates a new board" do
    visit new_board_path
    fill_in :board_name, with: "cool board name"
    attach_file :board_banner, File.expand_path("spec/fixtures/forttree.png")
    fill_in :password, with: "REALLYCOOLPASSWORD"
    click_button "submit"
    page.should have_content "Board created"
    page.should have_content "cool board name"
  end

  it "doesn't create a new board with wrong password" do
    visit new_board_path
    fill_in :board_name, with: "cool board name"
    attach_file :board_banner, File.expand_path("spec/fixtures/forttree.png")
    fill_in :password, with: "TOTALLWRONGPASSWORD"
    click_button "submit"
    page.should have_content "Incorrect password"
  end

  it "updates existing board" do
    @board = Board.create name: "cool board name"
    visit edit_board_path @board
    fill_in :board_name, with: "new board name"
    attach_file :board_banner, File.expand_path("spec/fixtures/forttree.png")
    fill_in :password, with: "REALLYCOOLPASSWORD"
    click_button "submit"
    page.should have_content "Board updated"
    page.should have_content "new board name"
  end

  it "doesnt update existing board with wrong password" do
    @board = Board.create name: "cool board name"
    visit edit_board_path @board
    fill_in :board_name, with: "new board name"
    attach_file :board_banner, File.expand_path("spec/fixtures/forttree.png")
    fill_in :password, with: "TOTALLWRONGPASSWORD"
    click_button "submit"
    page.should have_content "Incorrect password"
    page.should_not have_content "new board name"
  end

  it "destroys board" do
    @board = Board.create name: "cool board name"
    visit edit_board_path @board
    fill_in :delete_password, with: "REALLYCOOLPASSWORD"
    click_button "Delete board"
    page.should have_content "Board deleted!"
  end
  it "doesn't destroy board with wrong password" do
    @board = Board.create name: "cool board name"
    visit edit_board_path @board
    fill_in :delete_password, with: "TOTALLWRONGPASSWORD"
    click_button "Delete board"
    page.should have_content "Incorrect password"
  end
end