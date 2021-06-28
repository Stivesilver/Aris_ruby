class TasksController < ApplicationController
  before_action :logged_in_user

  def index
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to show_project_path(@project)
  end

  def show
    @task = Task.find(params[:id])
    @users = @task.users
    @project = @task.project
  end

  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.build(task_params)
    if @task.save
      #@project.tasks << @task
      @task.users << current_user
      redirect_to show_project_path(@project)
    else
      render 'home/index'
    end
  end

  def destroy
    form = params[:form]
    @project = Project.find(params[:project_id])
    if form == 'users'
      @user = User.find(params[:user_id])
      @task = @user.tasks.find(params[:id])
      @task.users.delete(@user)
      if @user == current_user
        redirect_to show_project_path(@project)
      else
        redirect_to show_task_path(@task)
      end
    else
      @task = @project.tasks.find(params[:id])
      @project.tasks.delete(@task)
      redirect_to show_project_path(@project)
    end
  end

  def search
    q = params[:email]
    i = params[:task_id]
    t = params[:project_id]
    @task = Task.find(i)
    @project = Project.find(t)
    @project.teams.each { |team|
      @user = team.users.find_by_email(q)
    }
    if !@user.nil?
      @task.users << @user
    end
    redirect_to show_task_path(@task)
  end

  private

  def task_params
    params.require(:task).permit(:name, :content, :status, :start_date, :due_date, :estimation)
  end
end

