module SessionsHelper

    def sign_in(user)
      self.current_user = user
      session[:user_id] = user.id
    end

	  def current_user
  		@current_user ||= User.find(session[:user_id]) if session[:user_id]
  	end

  	def current_user=(user)
  		@current_user = user
  	end

  	def current_user?(user)
  		user == current_user
  	end

  	def signed_in?
		!current_user.nil?
	  end

    def sign_out
      self.current_user = nil
      session[:user_id] = nil
    end
	
end
