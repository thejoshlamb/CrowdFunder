class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def new
    @user = User.new
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_path(current_user.id), :notice => "#{@user.username} updated."
    else
      render :edit
    end
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
