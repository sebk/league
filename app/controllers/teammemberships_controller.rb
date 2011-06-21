class TeammembershipsController < ApplicationController

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

end
