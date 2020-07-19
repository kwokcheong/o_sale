class UsersController < ApplicationController
  def new
    @user = User.new #this will make the field available for the form that we will fill up.
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash.now[:notice] = "Signed up successfully"
      redirect_to root_path
    else
      flash.now[:alert] = "Sign up Failed"
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name,:last_name, :email, :password)
  end
end
