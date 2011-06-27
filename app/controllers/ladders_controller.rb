class LaddersController < ApplicationController

  before_filter :authenticate_user!

  respond_to :html, :json

  def index
    @ladders = Ladder.all
    respond_with(@ladders)
  end

  def edit
    @ladder = Ladder.find(params[:id])
  end


  def update
    @ladder = Ladder.find(params[:id])
    if @ladder.update_attributes(params[:ladder])
      flash[:success] = "Änderungen wurden gespeichert"
      redirect_to ladder_path(@ladder)
    else
      flash[:error] = "Änderungen konnten nicht gespeichert werden"
      render :edit
    end
  end

  def create
    @ladder = Ladder.new(params[:ladder])
    if @ladder.save
      flash[:success] = "Ladder wurde erstellt"
      redirect_to ladders_path
    else
      flash[:error] = "Ladder konnte nicht erstellt werden"
      render :new
    end
      
  end

  def new
    @ladder = Ladder.new
  end

  def show
    @ladder = Ladder.find(params[:id])
    respond_with(@ladder)
  end

  def destroy
    @ladder = Ladder.find(params[:id])
    if @ladder.destroy
      flash[:success] = "Ladder wurde gelöscht"
    else
      flash[:error] = "Ladder konnte nicht gelöscht werden"
    end
    redirect_to ladders_path
  end

end
