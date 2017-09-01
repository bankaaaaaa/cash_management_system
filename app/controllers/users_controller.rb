class UsersController < ApplicationController
  def new
		@user = User.new
	end

  def create
    @user = User.new(user_params)
    if @user.save
      #flash.now[:success] = "User successfully created"
      log_in(@user)
      redirect_to accounts_path
    else
      render 'users/new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :is_admin)
  end
end
