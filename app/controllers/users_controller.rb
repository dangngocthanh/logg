class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(data_params)
    if @user.save
      session[:user_id] = @user.id
    else
      @user = User.new
      render :new
    end
  end

  def index
    @user = User.all.order(' id desc')
    @users = @user.limit(1)
    @users = @users[0].id
  end

  private
  def data_params
    params.require(:user).permit(:email, :password)
  end


end
