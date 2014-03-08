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

	validates_presence_of :body, message: "Text can't be blank" , length: { maximum: 500 }
end
