# == Schema Information
#
# Table name: comments
#
#  id          :integer          not null, primary key
#  resource_id :integer
#  user_id     :integer
#  body        :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Comment < ActiveRecord::Base
	belongs_to :resource
	belongs_to :user

	validates :body,  presence: true, length: { maximum: 500, message: "Text can't be blank" }
end
