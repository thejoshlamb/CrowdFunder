class MessagesController < ApplicationController
  def new
  end

  def create
  	@message = params[:message]
  	BackerMailer.single_backer_email(current_user.email, User.find(params[:backer_id]).email, @message).deliver
  	redirect_to root_path
  end
end
