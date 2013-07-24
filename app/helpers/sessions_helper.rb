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

    def correct_user
      render text: "Access denied", status: :unauthorized unless current_user?(@resource.user)
    end

    def gravatar_for(user)
      gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
      gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
      image_tag(gravatar_url, alt: user.name, class: "gravatar")
    end
	
end
