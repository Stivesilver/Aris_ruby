class PersonsController < ApplicationController
  def profile
    @user = current_user
    @teams = @user.teams
  end
end
