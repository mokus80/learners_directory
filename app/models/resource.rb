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
#  user_id    :integer
#

class Resource < ActiveRecord::Base
	has_many :ratings
	has_many :comments, :dependent => :destroy
	belongs_to :user
	has_many :taggings, :dependent => :destroy
	has_many :tags, :through => :taggings

	# validates :title,  presence: true, length: { maximum: 50 }
 #  	VALID_LINK_REGEX = /http:/
 #  	validates :link, presence: true, format: { with: VALID_LINK_REGEX }

	def average_rating
		if self.ratings.first.nil? == false
			@value = 0
			self.ratings.each do |rating|
				@value = @value + rating.value
			end
			@total = self.ratings.size
			@value.to_f / @total.to_f
		else
			@total = 0
		end
	end


	def tag_names
		# @tags = Tag.all
 		tags.pluck(:name).join(", ")
 	end

	def tag_names=(names)
 		self.tags = names.map { |tag| Tag.where(name: tag).first }
 	end

	# def self.tagged_with(name)
 #    	Tag.find_by_name!(name).resources
 #  	end

 #  	def tag_names
 #    	@tag_names || tags.map(&:name).join(' ')
 #  	end
  
 #  	private
  
 #  	def assign_tags
 #    	if @tag_names
 #      		self.tags = @tag_names.split(/\,/).map do |name|
 #        	Tag.find_or_create_by_name(name)
 #      		end
 #    	end
 #  	end

end
