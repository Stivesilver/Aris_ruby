class ProjectsController < ApplicationController
  before_action :logged_in_user

  def index
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @team = Team.find(params[:team_id])
    @project = Project.find(params[:id])
    @project.update(projects_params)
    redirect_to show_team_path(@team)
  end

  def show
    @project =Project.find(params[:id])
    @teams = @project.teams
    @tasks = @project.tasks
  end

  def create
    @team = Team.find(params[:team_id])
    @project = @team.projects.build(projects_params)
    if @project.save
      #flash[:success] = "Team created!"
      @project.teams << @team
      redirect_to show_team_path(@team)
    else
      render 'home/index'
    end
  end

  def destroy
    @team = Team.find(params[:team_id])
    @current_team = Team.find(params[:current_team_id])
    @project = @team.projects.find(params[:id])
    @project.teams.delete(@team)
    if @team == @current_team
      redirect_to show_team_path(@team)
    else
      redirect_to show_project_path(@project)
    end
  end

  def search
    q = params[:name]
    i = params[:project_id]
    @team = Team.find_by_name(q)
    @project = Project.find(i)
    if !@team.nil?
      @project.teams << @team
    end
    redirect_to show_project_path(@project)
  end

  private

  def projects_params
    params.require(:project).permit(:name, :summary, :start_date, :end_date)
  end
end
