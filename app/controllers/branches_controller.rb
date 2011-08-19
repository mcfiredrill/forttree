class BranchesController < ApplicationController

  before_filter :check_password, :only => [:destroy]

  def index
    @branch = Branch.new
    @leaf = Leaf.new
    @branches = Branch.paginate(:page => params[:page])

		redirect_to 'http://fortchan.org/'

    respond_to do |format|
      format.html
      format.js {
        render :update do |page|
          page.replace_html 'page', :partial => 'cur_page'
        end
      }
    end
  end

  def new
    @branch = Branch.new
    @leaf = Leaf.new
    @branches = Branch.paginate(:page => params[:page])

    respond_to do |format|
      format.html
      format.js {
        render :update do |page|
          page.replace('page', :partial => 'cur_page')
        end
      }
    end
  end

  def create
    @branch = Branch.new(:last_post_at => Time.now)
    @leaf = Leaf.new(params[:leaf])
    @branches = Branch.paginate(:page => params[:page])

    respond_to do |format|
      if @branch.save
        @leaf.branch_id = @branch.id
        if @leaf.save
          flash[:success] = "Branch created!"
          format.html { redirect_to new_branch_path }
        else
          @branch.destroy #destroy branch so we dont end up with a branch with no leafs
          format.html { render :action => "new" }
        end
      else
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
    logger.info("branch destroy")
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
end
