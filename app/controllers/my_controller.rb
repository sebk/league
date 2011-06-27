class MyController < ApplicationController
  respond_to :html, :json

  def my_teams
    @teams = current_user.teams
    respond_with(@teams)
  end
end
