require 'test_helper'

class ResourcesControllerTest < ActionController::TestCase

  # test "should get index" do
  #   get :index
    
  #   assert_nil resources
  # end

#   test "should get new" do
#     get :new
#     assert_response :success
#   end

  test "should create a new resource with given parameters" do
    post :create, {resource: { link: "http://barry.com.au", summary: "Barry is awesome", title: "Barry Bloke" }}

    resource = Resource.find_by_title("Barry Bloke")

    assert resource != nil
    assert resource.link == "http://barry.com.au"
    assert resource.summary == "Barry is awesome"
  end

  test "user should see resource posted successfully" do
    post :create, {resource: { link: "http://barry.com.au", summary: "Barry is awesome", title: "Barry Bloke" }}

    resource = Resource.find_by_title("Barry Bloke")

    assert_redirected_to "/resources/#{resource.id}"
  end

  ##AUTHORIZATION TESTS
  
  # Requirement: Ensure only signed-in users are able to post a resource
  
  test "non-signed in users cannot post a resource" do
    get :new

    assert response.body.include?("You must sign-in to post a Resource")
  end

  test "signed-in users can post a resource" do
    # given users are aleady signed in
    u = User.create(:name => "nicole", :email => "nicole@me.com")
    # when user clicks on new resource  
    puts "USER IS #{u.name}" 
    get :new, {}, { :user_id => u.id }
    #assert response.body.include?("Create Resource")
    assert_select "form input"

    assert !response.body.include?("You must sign-in to post a Resource")

  end

  # test "should show resource" do
  #   get :show, id: @resource
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get :edit, id: @resource
  #   assert_response :success
  # end

  # test "should update resource" do
  #   patch :update, id: @resource, resource: { link: @resource.link, summary: @resource.summary, title: @resource.title }
  #   assert_redirected_to resource_path(assigns(:resource))
  # end

  test "should destroy resource if user is admin" do
    #given user is admin
    u = User.create(:name => "nicole", :email => "nicole@me.com", :admin => true)

    resource = Resource.create!(:title => "hi", :link => "http://hallo.com", :summary => "hi")

    #when the admin user clicks 'destroy resource' 
    delete :destroy, { :id => resource.id }, { :user_id => u.id }
    assert_response :redirect

    assert_nil Resource.exists?(resource.id)
  end

  test "should destroy resource if user created the same resource" do
    #given user created a resource
    u = User.create(:name => "nicole", :email => "nicole@me.com", :admin => false)

    resource = Resource.create!(:user_id => u.id, :title => "hi", :link => "http://hallo.com", :summary => "hi")

    #when the user clicks 'destroy resource' 
    delete :destroy, { :id => resource.id }, { :user_id => u.id }
    assert_response :redirect

    assert_nil Resource.exists?(resource.id)
  end

end
