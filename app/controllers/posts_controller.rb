class PostsController < ApplicationController
  before_filter :check_password, only: [:destroy]
  before_filter :setup_negative_captcha, only: [:create, :edit, :update]
  def index
    @board = Board.find(params[:board_id])
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
    board = Board.find(params[:board_id])
    @post_form = PostForm.new board, Branch.new, Leaf.new(@captcha.values)
    respond_to do |format|
      if @captcha.valid? && @post_form.save!
        flash[:success] = "Branch created!"
        format.html { redirect_to board_path(board) }
      else
        flash[:error] = "Couldn't create branch for some reason!"
        flash[:error] << " #{@captcha.error}" if @captcha.error
        format.html { redirect_to board_path(board) }
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
    @post_form = PostForm.new board, branch, Leaf.new(@captcha.values)
    respond_to do |format|
      if @captcha.valid? && @post_form.save!
        flash[:success] = "Leaf created!"
        format.html { redirect_to board_path(board) }
      else
        flash[:error] = "Couldn't create leaf for some reason!"
        flash[:error] << " #{@captcha.error}" if @captcha.error
        format.html { redirect_to board_path(board) }
      end
    end
  end
  def destroy
    board = Board.find(params[:board_id])
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
      format.html { redirect_to board_path(board) }
    end
  end

  private
  def leaf_params
    params.require(:leaf).permit(:name, :content, :photo)
  end

  def check_password
    unless Admin.authenticate(params[:password])
      flash[:error] = "Incorrect password!"
      redirect_to root_path
      return false
    else
      return true
    end
  end
end
