class TagsController < ApplicationController
	before_action :admin
	
	def index
		@tags = Tag.all
	end

	 def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    respond_to do |format|
      format.html { redirect_to tags_path }
      format.json { head :no_content }
    end
  end

end
