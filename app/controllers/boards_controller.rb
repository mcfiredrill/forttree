class BoardsController < ApplicationController
  before_filter :setup_negative_captcha, only: [:show]
  def index
    @latest_posts = Leaf.latest
  end
  def new
    @board = Board.new
  end
  def show
    @board = Board.find(params[:id])
    @post_form = PostForm.new @board
    @branches = @board.branches.paginate(page: params[:page])
    respond_to do |format|
      format.html
    end
  end
  def create
    @board = Board.new board_params
    respond_to do |format|
      if Admin.authenticate(params[:password])
        if @board.save!
          flash[:success] = "Board created!"
          format.html { redirect_to board_path @board }
        else
          flash[:error] = "Couldn't create board for some reason!"
          format.html { render action: 'new' }
        end
      else
          flash[:error] = "Incorrect password!"
          format.html { render action: 'new' }
      end
    end
  end
  def edit
    @board = Board.find(params[:id])
  end
  def update
    @board = Board.find(params[:id])

    respond_to do |format|
      if Admin.authenticate(params[:password])
        if @board.update_attributes! board_params
          flash[:success] = "Board updated!"
          format.html { redirect_to board_path @board }
        else
          flash[:error] = "Couldn't update board."
          format.html { render action: 'edit' }
        end
      else
        flash[:error] = "Incorrect password!"
          format.html { render action: 'edit' }
      end
    end
  end
  def destroy
    @board = Board.find(params[:id])

    respond_to do |format|
      if Admin.authenticate(params[:delete_password])
        if @board.destroy
          flash[:success] = "Board deleted!"
          format.html { redirect_to boards_path }
        else
          flash[:error] = "Couldnt delete board!"
          format.html { render action: 'edit' }
        end
      else
        flash[:error] = "Incorrect password!"
        format.html { render action: 'edit' }
      end
    end
  end

  private

  def board_params
    params.require(:board).permit(:name, :banner)
  end
end
