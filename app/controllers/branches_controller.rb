class BranchesController < ApplicationController

  before_action :check_password, :only => [:destroy]

  layout :set_layout

  def new
    @branch = Branch.new
    @leaf = Leaf.new
    @branches = Branch.page(params[:page])

    if request.headers['X-PJAX']
      render :partial => 'cur_page'
    end
  end

  def create
    @branch = Branch.new(:last_post_at => Time.now)
    @leaf = Leaf.new(leaf_params)
    @branches = Branch.page(params[:page])

    respond_to do |format|
      if @branch.save
        @leaf.branch_id = @branch.id
        if @leaf.save
          flash[:success] = "Branch created!"
          format.html { redirect_to new_branch_path }
        else
          flash[:error] = "Couldn't save leaf for some reason!"
          @branch.destroy #destroy branch so we dont end up with a branch with no leafs
          format.html { render :action => "new" }
        end
      else
        flash[:error] = "Couldn't create branch for some reason!"
        format.html { redirect_to new_branch_path }
      end
    end
  end

  def check_password
    unless Admin.authenticate(params[:password])
      flash[:error] = "Incorrect password for deletion"
      redirect_to new_branch_path
      return false
    else
      return true
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
      format.html { redirect_to new_branch_path }
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def leaf_params
    params.require(:leaf).permit(:name, :content, :photo)
  end

  protected

  def set_layout
    if request.headers['X-PJAX']
      false
    else
      "application"
    end
  end

end
