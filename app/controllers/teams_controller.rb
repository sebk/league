class TeamsController < ApplicationController

  before_filter :authenticate_user!
  
  respond_to :html, :json

  def create_participation
    @team = Team.find(params[:id])
    if current_user.teams.include?(@team)
      @participation = @team.participations.build(params[:participation])
      if @participation.save
        flash[:success] = "Das Team ist jetzt in der Liga."
      else
        flash[:error] = "Das Tesm konnte nicht in die Liga eingetragen werden."
      end
      redirect_to team_path(@team)
    end
  end
  
  def index
    @teams = current_user.teams
    respond_with(@teams)
  end

  def edit
    @team = Team.find(params[:id])
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
      render :file => File.join(RAILS_ROOT, 'public/403.html'), :status => :forbidden, :layout => false   #works
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
