class SessionsController < ApplicationController
	before_action :already_login, except: :destroy

	def new
	end

	def create
		user = User.find_by(email: params[:session][:email])
		
		if user && user.authenticate(params[:session][:password])
			log_in(user)
			redirect_to accounts_path
		else
			flash.now[:danger] = 'Invalid email/password combination'
      		render 'sessions/new'
		end
	end

	def destroy
		log_out
		redirect_to new_session_path
	end

	def show
	end

	
end
