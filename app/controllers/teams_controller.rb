class TeamsController < ApplicationController
  
  def create_participation
    @team = Team.find(params[:id])
    @participation = @team.participations.build(params[:participation])
    if @participation.save
      flash[:success] = "Das Team ist jetzt Mitglied"
    else
      flash[:error] = "Das Team ist jetzt ohne Glied"
    end
    redirect_to team_path(@team)
  end
  
  def index
    @teams = Team.all
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    if @team.update_attributes(params[:team])
      redirect_to team_path(@team)
    else
      render :edit
    end
  end

  def create
    @team = Team.new(params[:team])
    if @team.save
      redirect_to teams_path
    else
      render :new
    end
      
  end

  def new
    @team = Team.new
  end

  def show
    @team = Team.find(params[:id])
  end

  def destroy
    @team = Team.find(params[:id])
    @team.delete
    redirect_to teams_path
  end

end
