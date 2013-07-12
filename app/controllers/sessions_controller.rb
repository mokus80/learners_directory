class SessionsController < ApplicationController

 def create
    user = User.find_or_create_by(:email => auth_hash[:info][:email])
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
    #logger.info request.env['omniauth.auth']
    request.env['omniauth.auth']
  end

end

