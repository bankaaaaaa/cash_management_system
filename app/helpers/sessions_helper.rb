module SessionsHelper
	def log_in(user)
    	session[:user_id] = user.id
  	end

  	def current_user
    	@current_user ||= User.find_by(id: session[:user_id])
  	end    

  	# Returns true if the user is logged in, false otherwise.
  	def logged_in?
    	!current_user.nil?
  	end

  	def log_out
    	session.delete(:user_id)
    	@current_user = nil
  	end

  	def authenticate_user
    	redirect_to new_session_path unless current_user
  	end

    def already_login
      if logged_in?
        #render plain: "hello".inspect
        redirect_to accounts_path
        #flash.now[:danger] = "You are already loged in"
      end

    end


end
