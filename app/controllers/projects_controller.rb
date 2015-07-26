class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @projects = Project.all.order("created_at DESC").paginate(page: params[:page], per_page: 10)
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to @project, notice: "Your new project has been posted!"
    else
      render 'new', notice: "Sorry an error occurred. Please fix these and try again!"
    end
  end

  def show
  end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: "Yeah! Great job! The project has been updated!"
    else
      render 'edit'
    end
  end

  def edit
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  private

    def project_params
      params.require(:project).permit(:title, :description, :link, :thumbnail_image, :remove_thumbnail_image, :thumbnail_image_cache_id)
    end

    def find_project
      @project = Project.friendly.find(params[:id])
    end

end
