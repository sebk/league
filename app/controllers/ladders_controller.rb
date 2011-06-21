class LaddersController < ApplicationController
  def index
    @ladders = Ladder.all
  end

  def edit
    @ladder = Ladder.find(params[:id])
  end

  def update
    @ladder = Ladder.find(params[:id])
    if @ladder.update_attributes(params[:ladder])
      redirect_to ladder_path(@ladder)
    else
      render :edit
    end
  end

  def create
    @ladder = Ladder.new(params[:ladder])
    if @ladder.save
      redirect_to ladders_path
    else
      render :new
    end
      
  end

  def new
    @ladder = Ladder.new
  end

  def show
    @ladder = Ladder.find(params[:id])
  end

  def destroy
    @ladder = Ladder.find(params[:id])
    @ladder.delete
    redirect_to ladders_path
  end

end
