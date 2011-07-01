class GamesController < ApplicationController

  before_filter :authenticate_user!

  def create
    @ladder = Ladder.find(params[:ladder_id])
    @game = @ladder.games.build(params[:game])

    begin
      team1 = Team.find(@game.team1_id)
      team2 = Team.find(@game.team2_id)
      @game.team1_name = team1.name
      @game.team2_name = team2.name
    rescue ActiveRecord::RecordNotFound
      #do something nice
    end

    if @game.save
      redirect_to ladder_path(@ladder)
    else
      flash[:error] = "Das Spiel konnte nicht angelegt werden"
      render :new
    end
  end

  def new
    @ladder = Ladder.find(params[:ladder_id])
    @game = @ladder.games.build
  end


end
