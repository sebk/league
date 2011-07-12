class TeammembershipsController < ApplicationController

  before_filter :authenticate_user!

def new
  @user = User.find(params[:user_id])
  @teammembership = @user.teammemberships.build
end

def create
  @user = User.find(params[:user_id])
  @teammembership = @user.teammemberships.build(params[:teammembership])
  if @teammembership.save
    flash[:success] = "Speichern erfolgreich"
    redirect_to user_path(@user)
  else
    flash[:error] = "Speichern nicht erfolgreich"
    render :new
  end
end

def destroy
  @teammembership = Teammembership.find(params[:id])
  @teammembership.destroy
  redirect_to team_path
end
end
