class GamesController < ApplicationController

  before_filter :authenticate_user!

  def create
    @ladder = Ladder.find(params[:ladder_id])
    @game = @ladder.games.build(params[:game])
    @game.save
    redirect_to ladder_path(@ladder)
  end

  def new
    @ladder = Ladder.find(params[:ladder_id])
    @game = @ladder.games.build
  end


end
