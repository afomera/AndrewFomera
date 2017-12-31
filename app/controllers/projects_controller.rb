class ProjectsController < ApplicationController
  before_action :find_project, only: %w(show edit update destroy)
  before_action :authenticate_user!, except: %w(index show)
  before_action :check_admin_status, only: %w(new create edit update destroy)

  def index
    @projects = Project.all.
      order("created_at DESC").
      paginate(page: params[:page], per_page: 10)
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

  def edit; end

  def destroy
    @project.destroy
    flash[:success] = "That project has been successfully removed."
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(
      :title, :description, :link, :thumbnail_image,
      :remove_thumbnail_image, :thumbnail_image_cache_id
    )
  end

  def find_project
    @project = Project.friendly.find(params[:id])
  end

end
