class ProjectsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @project = current_user.projects.build(projects_params)
    if @project.save
      flash[:success] = "Project created!"
      redirect_to root_url
    else
      render 'home/index'
    end
  end

  def destroy
  end

  private

  def projects_params
    params.require(:projects).permit(:name, :summary, :start_date, :end_date)
  end
end
