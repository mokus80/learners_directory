class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :ensure_correct_user_for_comment, only: [:edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
    @resource.user = current_user
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
    @resource = Resource.find(params[:resource_id])
    # @resource.comment
    
    # @comment.resource_id = Comment.find(params[:resource_id])
  end

  # POST /comments
  # POST /comments.json

  def create
    @comment = Comment.new(comment_params)
    @comment.resource_id = params[:resource_id]
    @resource = Resource.find(params[:resource_id])
    if signed_in?
      @comment.user_id = current_user.id
      if @comment.save
        respond_to do |format|
          format.html { redirect_to resource_path(@comment.resource_id), :notice => "Your comment has been saved" }
          format.js
        end
      else
        respond_to do |format|
          format.html { render action: 'new' }
        end
        #format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    else
      respond_to do |format|
        format.html { render action: 'new' }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    @resource = @comment.resource
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to resource_url(params[:resource_id]), notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to resource_url(params[:resource_id]) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:resource_id, :user_id, :body)
    end

    def ensure_correct_user_for_comment
      ensure_correct_user(@comment)
    end
end
