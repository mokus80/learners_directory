# == Schema Information
#
# Table name: resources
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  summary    :string(255)
#  link       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Resource < ActiveRecord::Base
	has_many :ratings
	belongs_to :user

	def average_rating
		if self.ratings.first.nil? == false
			@value = 0
			self.ratings.each do |rating|
				@value = @value + rating.value
			end
			@total = self.ratings.size
			@value.to_f / @total.to_f
		else
			"This resource has not been rated yet."
		end
	end

end
