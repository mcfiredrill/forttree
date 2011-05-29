class LeafsController < ApplicationController

  def new
    @leaf = Leaf.new
    @branch = Branch.find(params[:branch])
    $theid = @branch.id

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def create
    @parentbranch = Branch.find($theid)
    @leaf = Leaf.new(params[:leaf])
    @leaf.branch_id = @parentbranch.id

    respond_to do |format|
      if @leaf.save
        @parentbranch.last_post_at = Time.now
        if @parentbranch.save
          flash[:success] = "Leaf created!"
          format.html { redirect_to('/branches#index') }
        else
          flash[:error] = "Leaf not created for some reason"
          format.html { redirect_to('/branches#index') }
        end
      else
        @branch = Branch.find($theid)
        format.html { render :action => "new" }
      end
    end
  end

  def destroy
    @leaf = Leaf.find(params[:id])
    @branch = Branch.find(@leaf.branch_id)

    respond_to do |format|
      if @branch.leafs.count <= 1
        if @branch.destroy
          flash[:success] = "Branch pruned!"
          format.html { redirect_to('/branches#index') }
        end
      elsif @leaf.destroy
          flash[:success] = "Leaf pruned!"
          format.html { redirect_to('/branches#index') }
      end
    end
  end
end
