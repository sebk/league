class GamesController < ApplicationController

  before_filter :authenticate_user!

  def create
    @ladder = Ladder.find(params[:ladder_id])
    @game = @ladder.games.build(params[:game])
    
    @team1 = Team.find(@game.team1_id)
    @team2 = Team.find(@game.team2_id)
    @game.team1_name = @team1.name
    @game.team2_name = @team2.name

    @game.save
    redirect_to ladder_path(@ladder)
  end

  def new
    @ladder = Ladder.find(params[:ladder_id])
    @game = @ladder.games.build
  end


end
