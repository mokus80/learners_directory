# == Schema Information
#
# Table name: services
#
#  id         :integer          not null, primary key
#  provider   :string(255)
#  uid        :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Service < ActiveRecord::Base
  belongs_to :user
end
