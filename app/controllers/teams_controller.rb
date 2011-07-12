class TeamsController < ApplicationController

  before_filter :authenticate_user!
  
  respond_to :html, :json

  
  def index
    @teams = current_user.teams
    respond_with(@teams)
  end

  def edit
    @team = Team.find(params[:id])
    if !@team.users.include?(current_user)
      render_forbidden
    end
  end

  def update
    @team = Team.find(params[:id])
    if @team.users.include?(current_user)
      if @team.update_attributes(params[:team])
        redirect_to team_path(@team)
      else
        render :edit
      end
    else
      render_forbidden
    end
  end

  def create
    @team = Team.new(params[:team])
    if @team.save
      @membership = current_user.teammemberships.build(:team => @team)
      @membership.save
      redirect_to team_path(@team)
    else
      render :new
    end
      
  end

  def new
    @team = Team.new
  end

  def show
    @team = Team.find(params[:id])
    @available_ladders = Ladder.without_team(@team)
    puts @team.id
    @teammembership = current_user.teammemberships.find(@team.id)
    respond_with(@team)
  end

  def destroy
    @team = Team.find(params[:id])
    if @team.users.include?(current_user)
      @team.destroy
      redirect_to teams_path
    end
  end

  def users
    @team = Team.find(params[:id])
    @users = @team.users
    respond_with(@users)
  end
end
