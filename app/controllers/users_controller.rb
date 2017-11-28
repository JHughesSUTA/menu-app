class UsersController < ApplicationController
  def new
    @user = User.new
    if current_user && current_user.admin == false
      flash[:warning] = "You are already signed up!"
      redirect_to "/"
    else
      render "new.html.erb"
    end
  end

  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      admin: params[:admin]
    )
    if @user.save
      session[:user_id] = current_user ? current_user.id : @user.id    #keeps admin logged in after adding a new user
      flash[:success] = "Successfully added user"
      redirect_to "/"
    else
      render "new.html.erb"
    end
  end
end