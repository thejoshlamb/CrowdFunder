class ProjectsController < ApplicationController

  #will reject anonymous users from creating a new project with no explanation, should be elaborated
  before_filter :require_login, :only => [:create, :edit, :destroy] 

  def index
    @projects = Project.all

    respond_to do |format|
      format.js
      format.html
    end
  end

  def show
    @project = Project.find(params[:id])
    @comment = Comment.new
  end

  def new
    redirect_to login_path unless current_user
    @project = Project.new
    @uploader = PictureUploader.new
  end

  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id
    if @project.save
      redirect_to new_project_tier_path(@project.id)
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
      redirect_to new_project_tier_path(@project.id)
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
    params.require(:project).permit(:name,:description,:deadline,:goal,:picture)
  end

end
