class RatingsController < ApplicationController
	def create
		@resource = Resource.find_by_id(params[:resource_id])
		if current_user.id == @resource.id
			redirect_to resource_path(@resource), :alert => "You cannot rate your own resource"
		else
			@rating = Rating.new(params[:rating])
			@rating.resource_id = @resource.id
			@rating.user_id = current_user.id
			if @rating.save
				respond_to do |format|
					format.html { redirect_to resource_path(@resource), :notice => "Your rating has been saved" }
					format.js
				end
			end
		end
	end

	def update
		@resource = Resource.find_by_id(params[:resource_id])
		if current_user.id == @resource.id
			redirect_to resource_path(@resource), :alert => "You cannot rate your own resource"
		else
			@rating = current_user.ratings.find_by_resource_id(@resource.id)
			if @rating.update_attributes(params[:rating])
				respond_to do |format|
					format.html { redirect_to resource_path(@resource), :notice => "Your rating has been updated" }
					format.js
				end
			end
		end
	end
end
