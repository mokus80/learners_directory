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
#  email      :string(255)
#  admin      :boolean          default(FALSE)
#

class User < ActiveRecord::Base
	has_many :ratings, :dependent => :destroy
	has_many :resources, :dependent => :destroy
	has_many :comments, :dependent => :destroy
end
