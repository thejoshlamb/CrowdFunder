class TiersController < ApplicationController
  def new
  	@project = Project.find(params[:project_id])
  	@tier = Tier.new
  end

  def create
  	@project = Project.find(params[:project_id])
  	@tier = @project.tiers.build(tier_params)
  	@tier.save
  	redirect_to new_project_tier_path
  end

  def edit
  end

  def update
  end

  def tier_params
    params.require(:tier).permit(:name,:description,:amount)
  end
end
