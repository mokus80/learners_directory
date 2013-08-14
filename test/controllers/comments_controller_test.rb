require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  # setup do
  #   @comment = comments(:one)
  # end

  # test "should get index" do
  #   get :index
  #   assert_response :success
  #   assert_not_nil assigns(:comments)
  # end

  # test "should get new" do
  #   get :new
  #   assert_response :success
  # end

  test "user can delete their comment" do
    #given a user who created a comment
    u = User.create(:name => "nicole", :email => "nicole@me.com", :admin => false)

    resource = Resource.create!(:title => "hi", :link => "http://hallo.com", :summary => "hi")

    comment = Comment.create(:user_id => u.id, :resource_id => resource.id, :body => "ew")
    #when the user clicks 'delete comment'
    delete :destroy, { :id => comment.id, :resource_id => resource.id }, { :user_id => u.id }
    assert_response :redirect

    #then the comment gets deleted 
    assert_nil Comment.exists?(comment.id)
  end

  test "user can post a comment" do
    #given a user is signed in and writes a comment
    u = User.create(:name => "nicole", :email => "nicole@me.com", :admin => false)

    resource = Resource.create!(:title => "hi", :link => "http://hallo.com", :summary => "hi")

    #when they click 'create comment'
    post :create, {}, { :user_id => u.id }
    #then a comment gets posted 
    assert_redirected_to resource_path(comment: "resource_id")
    #assert_select "form input"

  end


  #   assert_difference('Comment.count') do
  #     post :create, comment: { body: @comment.body, resource_id: @comment.resource_id, user_id: @comment.user_id }
  #   end

  #   assert_redirected_to comment_path(assigns(:comment))
  # end

  # test "should show comment" do
  #   get :show, id: @comment
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get :edit, id: @comment
  #   assert_response :success
  # end

  # test "should update comment" do
  #   patch :update, id: @comment, comment: { body: @comment.body, resource_id: @comment.resource_id, user_id: @comment.user_id }
  #   assert_redirected_to comment_path(assigns(:comment))
  # end

  #   assert_redirected_to comments_path
  # end
end
