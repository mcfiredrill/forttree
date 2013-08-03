class PostsController < ApplicationController
  before_filter :check_password, :only => [:destroy]
  def index
    board_id = DEFAULT_BOARD || Board.first.id
    respond_to do |format|
      if board_id 
        format.html { redirect_to post_path Board.find(board_id) }
      else
        format.html
      end
    end
  end
  def new
    @board = Board.find(params[:id])
    @post_form = PostForm.new @board
    @branches = @board.branches.paginate(page: params[:page])
    respond_to do |format|
      format.html
    end
  end
  def create
    board = Board.find(params[:id])
    @post_form = PostForm.new board, Branch.new, Leaf.new(leaf_params)
    respond_to do |format|
      if @post_form.save!
        flash[:success] = "Branch created!"
        format.html { redirect_to post_path }
      else
        flash[:error] = "Couldn't create branch for some reason!"
        format.html { redirect_to post_path }
      end
    end
  end
  def edit
    @board = Board.find(params[:board_id])
    @branch = Branch.find(params[:id])
    @post_form = PostForm.new @board, @branch, Leaf.new
  end
  def update
    board = Board.find(params[:board_id])
    branch = Branch.find(params[:id])
    @post_form = PostForm.new board, branch, Leaf.new(leaf_params)
    respond_to do |format|
      if @post_form.save!
        flash[:success] = "Leaf created!"
        format.html { redirect_to post_path(board) }
      else
        flash[:error] = "Couldn't create leaf for some reason!"
        format.html { redirect_to post_path(board) }
      end
    end
  end
  def destroy
    params[:delete].each do |id|
      @leaf = Leaf.find(id)
      @branch = Branch.find(@leaf.branch_id)
      if @branch.leafs.count <= 1
        if @branch.destroy
          flash[:success] = "Branch pruned!"
        end
      elsif @leaf.destroy
          flash[:success] = "Leaf pruned!"
      end
    end

    respond_to do |format|
      format.html { redirect_to post_path }
    end
  end

  private
  def leaf_params
    params.require(:leaf).permit(:name, :content, :photo)
  end
  def check_password
    unless Admin.authenticate(params[:password])
      flash[:error] = "Incorrect password for deletion"
      redirect_to post_path
      return false
    else
      return true
    end
  end
end
