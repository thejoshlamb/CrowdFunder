class PledgesController < ApplicationController

	# this before login will be necessary eventually
	# before_filter :require_login

	before_filter :load_project

	def new
	end

	def show
	  @pledge = Pledge.find(params[:id])
	end

	def create
	  @pledge = @product.reviews.build(review_params)
  	@pledge.user_id = current_user.id
  	if @pledge.save
  		redirect_to project_path(params[:id])
		end
	end

	private

	def load_project
  	@project = Project.find(params[:project_id])
 	end

	def pledge_params
	  params.require(:pledge).permit(:amount, :user_id)
	end

end
