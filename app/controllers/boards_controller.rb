class BoardsController < ApplicationController
  before_filter :check_password, except: [:show, :index]

  def index
    @boards = Board.all
  end
  def new

  end
  def create
  end
  def show
    board = Board.find(params[:id]) || DEFAULT_BOARD || Board.first
    branch = Branch.new
    leaf = Leaf.new
    @new_post = NewPost.new board, branch, leaf
    @branches = board.branches.paginate(page: params[:page])
  end
  def edit

  end
  def update

  end
  def destroy
  end

  private

  def board_params
    params.require(:board).permit(:name, :config)
  end
end
