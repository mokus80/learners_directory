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
end
