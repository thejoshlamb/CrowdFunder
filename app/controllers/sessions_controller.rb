class SessionsController < ApplicationController
	def new
	end

	def create
		if @user = login(params[:email],params[:name],params[:password])
			redirect_back_or_to projects_path
		else
			render :new
		end
	end

	def destroy
		logout
		redirect_to root_url
	end
end
