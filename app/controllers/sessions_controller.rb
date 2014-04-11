class SessionsController < ApplicationController

  def create
    info = auth_hash[:info]
    user = User.find_or_create_by(:email => info[:email], :name => info[:nickname])
    if user.nil?
    	redirect_to '/auth/:provider/callback'
    else
    	sign_in user
    	redirect_to '/', :notice => "Signed in!"
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