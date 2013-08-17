require 'spec_helper'

describe PostForm do
  it "saves" do
    board = Board.create
    branch = Branch.new
    leaf = Leaf.new(name: 'hi', content: 'hello')
    new_post = PostForm.new board, branch, leaf
    new_post.save!
    [leaf,board,branch].each do |i| i.reload; end
    leaf.branch.should == branch
    branch.board.should == board
  end
  it "saves replies" do
    board = Board.create
    branch = Branch.create
    leaf = Leaf.new(name: 'hi', content: 'hello')
    new_post = PostForm.new board, branch, leaf
    new_post.save!
    [leaf,board,branch].each do |i| i.reload; end
    leaf.branch.should == branch
    branch.board.should == board

    leaf = Leaf.new(name: 'hi', content: 'hello again')
    new_post = PostForm.new board, branch, leaf
    new_post.save!
    [leaf,board,branch].each do |i| i.reload; end
    leaf.branch.should == branch
    branch.board.should == board
  end
end
