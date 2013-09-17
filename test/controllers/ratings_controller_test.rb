require 'test_helper'

class RatingsControllerTest < ActionController::TestCase
 
	test "user can delete their rating" do
		#given a user who created a rating
		u = User.create(:name => "nicole", :email => "nicole@me.com", :admin => true)

    	resource = Resource.create!(:title => "hi", :link => "http://hallo.com", :summary => "hi")

    	rating = Rating.create(:user_id => u.id, :resource_id => resource.id, :value => "3")
		#when the user clicks 'delete rating'
		delete :destroy, { :id => rating.id }, { :user_id => u.id }
		assert_response :redirect

		#then the rating gets deleted 
		assert_nil Rating.exists?(rating.id)
	end


	test "user can update their rating" do
		#given a user has created a rating
		u = User.create(:name => "nicole", :email => "nicole@me.com", :admin => true)

    	resource = Resource.create!(:title => "hi", :link => "http://hallo.com", :summary => "hi")

    	rating = Rating.create(:user_id => u.id, :resource_id => resource.id, :value => "3")

		#when they click 'update rating'
		patch :update, { :rating => { :value => "5", :resource_id => resource.id, :user_id => u.id}, :id => rating.id}, { :user_id => u.id }
		#then the rating gets updated
		assert_response :redirect
		assert_equal(5, rating.reload.value, "rating wasn't updated")
	end

end
