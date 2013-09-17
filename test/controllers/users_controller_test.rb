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
		#puts u.admin?
		#when they go to users/index
		get :index, {}, { :user_id => u.id }
	
		#then 
		assert response.body.include?("Users")
	end

	test "admin should be able to delete users" do
		#given user is admin
		u = User.create(:name => "nicole", :email => "nicole@me.com", :admin => true)

		user = User.create(:name => "laura", :email => "laura@me.com")
		#when they click 'delete user'
		delete :destroy, { :id => user.id }, { :user_id => u.id }
    	assert_response :redirect

    	assert_nil User.exists?(user.id)

		#then they should be able to delete the user
	end

	# ----> keeps failing
	test "user that is not admin should NOT be able to delete users" do
		#given user is not admin
		nicole = User.create(:name => "nicole", :email => "nicole@me.com", :admin => false)

		laura = User.create(:name => "laura", :email => "laura@me.com")

		#when they click 'delete user'
		delete :destroy, { :id => laura.id }, { :user_id => nicole.id }


    	refute_nil User.exists?(laura.id)

	end
end
