module RatingsHelper
	def rating_ballot(r_id)
		if @rating = current_user.ratings.find_by_resource_id(r_id)
			@rating
		else
			current_user.ratings.new({ :resource_id => r_id })
		end
	end

	def current_user_rating(r_id)
		if @rating = current_user.ratings.find_by_resource_id(r_id)
			@rating.value
		else
			"N/A"
		end
	end
end
