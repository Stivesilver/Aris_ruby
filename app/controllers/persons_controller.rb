class PersonsController < ApplicationController
  def profile
    @user = current_user
    @teams = @user.teams.paginate(page: params[:page])
  end
end
