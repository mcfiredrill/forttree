class LeafsController < ApplicationController
  def new
    @leaf = Leaf.new
    @branch = Branch.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  def create
    @leaf = Leaf.new(leaf_params)
    @leaf.branch_id = params[:branch_id]

    respond_to do |format|
      if @leaf.save
        flash[:success] = 'Leaf created!'
        format.html { redirect_to new_branch_path }
      else
        flash[:error] = 'Leaf not created for some reason'
        format.html { redirect_to new_branch_path }
      end
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the
  # white list through.
  def leaf_params
    params.require(:leaf).permit(:name, :content, :photo)
  end
end
