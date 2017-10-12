class SessionsController < ApplicationController
  def new
    if !current_user
      render "new.html.erb"
    else
      flash[:warning] = "You are already logged in"
      redirect_to "/"
    end
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id 
      flash[:success] = "Logged In"
      redirect_to "/"
    else
      flash[:warning] = "Invalid email or password"
      redirect_to "/login"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Logged Out"
    redirect_to "/login"
  end
end