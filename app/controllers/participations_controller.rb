class ParticipationsController < ApplicationController
  
  def create
    @team = Team.find(params[:team_id])
    if current_user.teams.include?(@team)
      @participation = @team.participations.build(params[:participation])
      if @participation.save
        flash[:success] = "Das Team ist jetzt in der Liga."
      else
        flash[:error] = "Das Team konnte nicht in die Liga eingetragen werden."
      end
      redirect_to team_path(@team)
    end
  end

  def destroy
    @team = Team.find(params[:team_id])
    @participation = @team.participations.find(params[:id])
    if @team.leaves(@participation.ladder)
      flash[:success] = "Team ist aus der Ladder ausgetreten"
    else
      flash[:error] = "Team konnte nicht austreten"
    end
    redirect_to team_path(@team)
  end


end
