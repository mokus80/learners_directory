require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  	test "user that is not admin should get 401 error when visiting users/index" do
  		#given user is not admin
  		#when they go to users/index
  		get :index
  		#then they should get http error 401
  		assert_response(401)
	end

	test "admin should be able to access users/index" do
		#given user is admin
		u = User.create(:name => "nicole", :email => "nicole@me.com", :admin => true)
		puts u.admin?
		#when they go to users/index
		get :index, {}, { :user_id => u.id }
		puts response.body
		#then 
		assert response.body.include?("Users")
	end
end
