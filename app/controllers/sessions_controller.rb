class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by(email: params[:email], password: params[:password])
    # p params[:password]
    # @user = User.find(1)
    if @user
      session[:user_id] = @user.id
      redirect_to logout_path
    else
      message = 'sai pw or mk'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end

  def logout
    if session[:user_id]
      @user = User.find(session[:user_id])
    else
      redirect_to :action => 'new'
    end
  end
end
