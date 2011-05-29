class LeafsController < ApplicationController
  def new
    @leaf = Leaf.new
    @branch = Branch.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  def create
    @parentbranch = Branch.find(params[:branch_id])
    @leaf = Leaf.new(params[:leaf])
    @leaf.branch_id = @parentbranch.id

    respond_to do |format|
      if @leaf.save
        @parentbranch.last_post_at = Time.now
        if @parentbranch.save
          flash[:success] = "Leaf created!"
          format.html { redirect_to new_branch_path }
        else
          flash[:error] = "Leaf not created for some reason"
          format.html { redirect_to new_branch_path }
        end
      else
        @branch = Branch.find(params[:branch_id])
        format.html { render :action => "new" }
      end
    end
  end
end
