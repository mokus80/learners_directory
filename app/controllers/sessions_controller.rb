class SessionsController < ApplicationController

 def create
    user = User.find_or_create_by_auth_hash(auth_hash)
    #self.current_user = user
    if user.nil?
    	redirect_to '/auth/:provider/callback'
    else
    	sign_in user
    	redirect_to root_path, :notice => "Signed in!"
 	end
 end

 def destroy
 	sign_out
 	redirect_to root_path
 end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

end

