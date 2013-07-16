# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  provider   :string(255)
#  uid        :string(255)
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  auth_hash  :Hash
#  email      :string(255)
#

class User < ActiveRecord::Base
	has_many :ratings
end
