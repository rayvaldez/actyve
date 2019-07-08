class SessionsController < ApplicationController

  def new
    @user = User.new
    render :login
  end

  def create
    if auth_hash = request.env["omniauth.auth"]
      @user = User.find_or_create_by_omniauth(auth_hash)
      session[:user_id] = @user.id

      redirect_to activities_path
    else

      @user = User.find_by(username: params[:user][:username])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to activities_path
      else
        redirect_to "/login"
      end
    end
  end

  def home
  end

  def destroy
    session.clear
    redirect_to '/'
  end
end
