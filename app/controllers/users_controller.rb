class UsersController < ApplicationController

  def show
    @user = user.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      auto_login(@user)
      redirect_back_or_to projects_path
    else
      render :new
    end
  end

  def destroy
    @user = user.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
