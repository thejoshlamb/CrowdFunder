class MessagesController < ApplicationController
  def new
  end

  def create
  	@message = params[:message]
  	@backer = User.find(params[:backer_id])
  	BackerMailer.single_backer_email(current_user, @backer, @message).deliver
  	redirect_back_or_to root_path
  end

end
