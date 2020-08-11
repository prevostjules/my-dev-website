class ProjectsController < ApplicationController
  before_action :set_project, only: [ :show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:show, :index]

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(set_params)
    @project.user = current_user
    if @project.save!
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @project.update(set_params)
    redirect_to project_path(@project)
  end

  def destroy
    @project.photo.purge
    @project.photos.purge
    @project.destroy
    redirect_to root_path
  end

  def index
    @projects = Project.all
  end

  private

  def set_params
    params.require(:project).permit(:title, :rich_body, :summary, :days, :workers, :link, :photo, :tag, { tag_ids: [] }, :tag_ids, photos: [])
  end

  def set_project
    @project = Project.find(params[:id])
  end

end

