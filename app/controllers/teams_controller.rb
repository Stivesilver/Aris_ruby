class TeamsController < ApplicationController
  before_action :logged_in_user

  def index
    @team = current_user.teams.find(params[:id])
  end

  def new
    @team = current_user.teams.new
  end

  def edit
    @team = current_user.teams.find(params[:id])
  end

  def update
    @team = current_user.teams.find(params[:id])
    @team.update(teams_params)
    redirect_to profile_path
  end

  def show
    @team = current_user.teams.find(params[:id])
    @users = @team.users
  end

  def create
    @team = current_user.teams.build(teams_params)
    if @team.save
      flash[:success] = "Team created!"
      @team.users << current_user
      redirect_to profile_path
    else
      render 'home/index'
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @team = @user.teams.find(params[:id])
    @team.users.delete(@user)
    if @user == current_user
      redirect_to profile_path
    else
      show_team_path(@team)
    end
  end

  def search
    q = params[:email]
    i = params[:team_id]
    @user = User.find_by_email(q)
    @team = Team.find(i)
    if !@user.nil?
      @team.users << @user
    end
    redirect_to show_team_path(@team)
  end

  private

  def teams_params
    params.require(:team).permit(:name)
  end
end
