class TagsController < ApplicationController
  before_action :admin
  
  def index
    @tag = Tag.new
    @tags = Tag.all
  end

  def create
    @tag = Tag.new(tag_params)
    respond_to do |format|
      if @tag.save
        format.html { redirect_to tags_url, notice: "Tag was successfully created." }
      else
        format.html { redirect_to tags_url, notice: 'Please create a tag' }
      end
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    respond_to do |format|
      format.html { redirect_to tags_path }
      format.json { head :no_content }
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end

end
