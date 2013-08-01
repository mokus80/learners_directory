class ResourcesController < ApplicationController
  before_action :set_resource, only: [:show, :comment, :edit, :update, :destroy]
  before_action :ensure_correct_user_for_resource, only: [:edit, :update, :destroy]

  # GET /resources
  # GET /resources.json
  def index
    logger.info "in resources#index"
    #@resources = Resource.all
    #@sorted_resources = Resource.order("title")
    @sorted_resources = Resource.all.sort_by { |resource| resource.average_rating }
    @sorted_desc_resources = @sorted_resources.reverse

  end

  def comment
   Resource.find(params[:id]).comments.create(params[:comment])
   flash[:notice] = "Added your comment"
   redirect_to :action => "show", :id => params[:id]
  end

  # GET /resources/1
  # GET /resources/1.json
  def show
    @comments = Comment.all
  end

  # GET /resources/new
  def new
    @resource = Resource.new
  end

  # GET /resources/1/edit
  def edit
  end

  # POST /resources
  # POST /resources.json
  def create
    @resource = Resource.new(resource_params)
    @resource.user = current_user
    respond_to do |format|
      if @resource.save
        format.html { redirect_to @resource, notice: 'Resource was successfully posted.' }
        format.json { render action: 'show', status: :created, location: @resource }
      else
        format.html { render action: 'new' }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resources/1
  # PATCH/PUT /resources/1.json
  def update
    respond_to do |format|
      if @resource.update(resource_params)
        format.html { redirect_to @resource, notice: 'Resource was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resources/1
  # DELETE /resources/1.json
  def destroy
    @resource.destroy
    respond_to do |format|
      format.html { redirect_to resources_url }
      format.json { head :no_content }
    end
  end

  def sort_by_rating
    @resources = Resource.all
    @resources.sort! { |resource| resource.average_rating }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resource
      @resource = Resource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resource_params
      params.require(:resource).permit(:title, :summary, :link, :user_id, :tag_names)
    end

    def ensure_correct_user_for_resource
      ensure_correct_user(@resource)
    end
end
