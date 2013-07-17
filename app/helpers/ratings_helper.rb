module RatingsHelper
	def rating_ballot(r_id)
		if @rating = current_user.ratings.find_by_resource_id(r_id)
			@rating
		else
			current_user.ratings.new
		end
	end

	def current_user_rating
		if @rating = current_user.ratings.find_by_resource_id(params[:id])
			@rating.value
		else
			"N/A"
		end
	end
end
