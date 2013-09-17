
# == Schema Information
#
# Table name: ratings
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  resource_id :integer
#  value       :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Rating < ActiveRecord::Base
	belongs_to :resource
	belongs_to :user
end
