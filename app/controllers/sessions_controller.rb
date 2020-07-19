class SessionsController < ApplicationController
  def new
    redirect_to root_path if current_user
  end

  def create
    #1. Find user by email and downcase it 
    user = User.find_by(email: params[:email].downcase)
    #2. Check if user can be authenticated using the password provided
    if user && user.authenticate(params[:password])
      cookies.signed[:user_id] = user.id
      flash[:notice] = "Sign in Successful"
      redirect_to root_path
    else
      flash.now[:alert] = "Invalid email/password combination"
      render :new
    end
    #3. If user is found and authenticated, then set signed cookie
    #4. Set an alert message and render new form

  end

  def destroy
    cookies.delete :user_id
    flash[:notice] = "You have been signed out"
    redirect_to root_path
  end
end
