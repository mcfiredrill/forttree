class BranchesController < ApplicationController

  before_filter :check_password, :only => [:destroy]

  # GET /branches
  # GET /branches.xml
  def index
    @branch = Branch.new
    @leaf = Leaf.new
    @branches = Branch.paginate(:page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.js {
        render :update do |page|
          page.replace_html 'page', :partial => 'cur_page'
        end
      }
    end
  end

  # GET /branches/1
  # GET /branches/1.xml
  #def show
  #  @branch = Branch.find(params[:id])

  #  respond_to do |format|
  #    format.html # show.html.erb
  #    format.xml  { render :xml => @branch }
  #  end
  #end

  # GET /branches/new
  # GET /branches/new.xml
  def new
    @branch = Branch.new
    @leaf = Leaf.new
    @branches = Branch.paginate(:page => params[:page])

    respond_to do |format|
      format.html # new.html.erb
      format.js {
        render :update do |page|
          page.replace('page', :partial => 'cur_page')
        end
      }
    end
  end

  # GET /branches/1/edit
  #def edit
  #  @branch = Branch.find(params[:id])
  #end

  # POST /branches
  # POST /branches.xml
  def create
    @branch = Branch.new(:last_post_at => Time.now)
    @leaf = Leaf.new(params[:leaf])
    @branches = Branch.paginate(:page => params[:page])

    respond_to do |format|
      if @branch.save
        #@leaf = Leaf.new(params[:leaf])
        #@leaf = Leaf.new(:content => params[:leaf][:content], :branch_id => @branch.id, :name => params[:leaf][:name],:photo => params[:leaf][:photo])
        @leaf.branch_id = @branch.id
        logger.info("lastpostat: #{ @branch.last_post_at }")
        logger.info("branch id: #{ @branch.id }")
        if @leaf.save
          flash[:success] = "Branch created!"
          format.html { redirect_to('/branches#index') }
        else
          @branch.destroy #destroy branch so we dont end up with a branch with no leafs
          #format.html { redirect_to('/branches#index') }
          format.html { render :action => "new" }
          logger.info("new branch, leaf save failed: #{ @leaf.errors }")
        end
      else
        format.html { redirect_to('/branches#index') }
      end
    end
  end

  # PUT /branches/1
  # PUT /branches/1.xml
  #def update
  #  @branch = Branch.find(params[:id])

  #  respond_to do |format|
  #    if @branch.update_attributes(params[:branch])
  #      format.html { redirect_to(@branch, :notice => 'Branch was successfully updated.') }
  #      format.xml  { head :ok }
  #    else
  #      format.html { render :action => "edit" }
  #      format.xml  { render :xml => @branch.errors, :status => :unprocessable_entity }
  #    end
  #  end
  #end
  
  def check_password
    unless Admin.authenticate(params[:password])
      flash[:error] = "Incorrect password for deletion"
      redirect_to('/branches#index')
      return false
    else
      return true
    end
  end

  # DELETE /branches/1
  # DELETE /branches/1.xml
  def destroy
  #  @branch = Branch.find(params[:id])
  #  @branch.destroy

    logger.info("ids: #{params[:delete]}")

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
      format.html { redirect_to('/branches#index') }
  #    format.xml  { head :ok }
    end
  end
end
