class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end


  def create
    @user = User.new(user_params)
    
    if @user.save
      auto_login(@user)
      redirect_back_or_to projects_path, :notice => "Account for #{@user.username} created. Sweet."
    else
      render :new
    end
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_path(current_user.id), :notice => "Account for #{@user.username} updated. Cool beans."
    else
      render :edit
    end
  end


  def destroy
    @user = user.find(params[:id])
    @user.destroy
    redirect_to root_path, :notice => "Account for #{@user.username} deleted. Lost like Lando."
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
