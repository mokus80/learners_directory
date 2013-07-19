class RatingsController < ApplicationController
	# def create
	# 	@resource = Resource.find_by(params[:resource_id])
	# 	if current_user.id == @resource.id
	# 		redirect_to resource_path(@resource), :alert => "You cannot rate your own resource"
	# 	else
	# 		@rating = Rating.new ratings_params
	# 		@rating.resource_id = @resource.id
	# 		@rating.user_id = current_user.id
	# 		if @rating.save
	# 			respond_to do |format|
	# 				format.html { redirect_to resource_path(@resource), :notice => "Your rating has been saved" }
	# 				format.js
	# 			end
	# 		end
	# 	end
	# end

	def create
		@rating = Rating.new ratings_params
		if @rating.save 
			logger.info "in create"
		else
			logger.info "fail"
		end
		respond_to do |format|
			format.html { redirect_to resource_path(@resource), :notice => "Your rating has been saved" }
			format.js
		end
	end


	# def update
	# 	@resource = Resource.find_by(params[:resource_id])
	# 	if current_user.id == @resource.id
	# 		redirect_to resource_path(@resource), :alert => "You cannot rate your own resource"
	# 	else
	# 		@rating = current_user.ratings.find_by_resource_id(@resource.id)
	# 		if @rating.update_attributes(ratings_params)
	# 			respond_to do |format|
	# 				format.html { redirect_to resource_path(@resource), :notice => "Your rating has been updated" }
	# 				format.js
	# 			end
	# 		end
	# 	end
	# end

	def update
		@rating = Rating.find(params[:id])
		if @rating.update(ratings_params)
			logger.info "rating updated"
		else
			logger.info "rating update failed"
		end
		respond_to do |format|
			format.html { redirect_to resource_path(@resource), :notice => "Your rating has been updated" }
			format.js
		end
	end

	private

	def ratings_params
		params.require(:rating).permit(:user_id, :resource_id, :value)
	end
end
