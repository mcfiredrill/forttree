class LeafsController < ApplicationController

  # GET /leafs/new
  # GET /leafs/new.xml
  def new
    @leaf = Leaf.new
    @branch = Branch.find(params[:branch])
    $theid = @branch.id

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @leaf }
    end
  end

  # GET /leafs/1/edit
  #def edit
  #  @leaf = Leaf.find(params[:id])
  #end

  # POST /leafs
  # POST /leafs.xml
  def create
    logger.info("the id: #{$theid}")
    logger.info("branch: #{@branch}")
    logger.info("params hash: #{ params }")
    logger.info("request_uri: #{ request.request_uri }")
    @parentbranch = Branch.find($theid)
    #@parentbranch = Branch.find(params[:branch])
    #@parentbranch = Branch.find(params[:leaf][:branch_id])
    #@leaf = Leaf.new(:content => params[:leaf][:content], :branch_id => @parentbranch.id, :name => params[:leaf][:name], :photo => params[:leaf][:photo])
    @leaf = Leaf.new(params[:leaf])
    @leaf.branch_id = @parentbranch.id

    respond_to do |format|
      if @leaf.save
        @parentbranch.last_post_at = Time.now
        if @parentbranch.save
          format.html { redirect_to('/branches#index', :notice => 'Leaf was successfully created.') }
          format.xml  { render :xml => @leaf, :status => :created, :location => @leaf }
        else
          format.html { redirect_to('/branches#index', :notice => 'Leaf was not created for some reason.') }
          format.xml  { render :xml => @parentbranch.errors, :status => :unprocessable_entity }
        end
      else
        @branch = Branch.find($theid)
        format.html { render :action => "new" }
        logger.info("reply, leaf save failed: #{ @leaf.errors }")
        format.xml  { render :xml => @leaf.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /leafs/1
  # PUT /leafs/1.xml
  #def update
  #  @leaf = Leaf.find(params[:id])

  #  respond_to do |format|
  #    if @leaf.update_attributes(params[:leaf])
  #      format.html { redirect_to(@leaf, :notice => 'Leaf was successfully updated.') }
  #      format.xml  { head :ok }
  #    else
  #      format.html { render :action => "edit" }
  #      format.xml  { render :xml => @leaf.errors, :status => :unprocessable_entity }
  #    end
  #  end
  #end

  # DELETE /leafs/1
  # DELETE /leafs/1.xml
  #def destroy
  #  @leaf = Leaf.find(params[:id])
  #  @leaf.destroy

  #  respond_to do |format|
  #    format.html { redirect_to(leafs_url) }
  #    format.xml  { head :ok }
  #  end
  #end
end
