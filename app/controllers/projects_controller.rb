class ProjectsController < ApplicationController

  #will reject anonymous users from creating a new project with no explanation, should be elaborated
  before_filter :require_login, :only => [:new, :create, :edit, :destroy] 

  def index
    @projects = Project.all

    respond_to do |format|
      format.js
      format.html
    end
  end

  def show
    @project = Project.find(params[:id])
    #@pledges = @project.pledge.build
    @comment = Comment.new
  end

  def new
    @project = Project.new
    @tier = @project.tiers.build
  end

  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id
    if @project.save
      redirect_to projects_url
    else
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    @project.user_id = current_user.id
    if @project.update_attributes(project_params)
      redirect_to projects_url
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_url
  end

  private
  def project_params
    params.require(:project).permit(:name,:description,:deadline,:goal, tiers_attributes: [:id, :name, :amount, :description])
  end

end
