class PledgesController < ApplicationController

	before_filter :require_login

	def index
	  @pledges = Pledge.all
	end

	def show
	  @pledge = Pledge.find(params[:id])
	end

	def new
	  @pledge = Pledge.new
	end

	def create
	  @pledge = Pledge.new(pledge_params)
	  
	  if @pledge.save
	    redirect_to pledges_url
	  else
	    render :new
	  end
	end

	def destroy
	  @pledge = pledge.find(params[:id])
	  @pledge.destroy
	  redirect_to pledges_url
	end

	private
	def pledge_params
	  params.require(:pledge).permit(:amount, :user_id)
	end

end
