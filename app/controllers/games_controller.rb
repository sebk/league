class GamesController < ApplicationController

  def create
    @ladder = Ladder.find(params[:ladder_id])
    @game = @ladder.games.build(params[:game])
    @game.save
    redirect_to ladder_path(@ladder)
  end


end
