class HomeController < ApplicationController
  before_filter :authenticate_user!

  respond_to :html, :json

  def me
    respond_with(current_user)
  end

  def editme
  end

  def join_team
    @membership = current_user.teammemberships.build(params[:teammembership])
    if @membership.save
      flash[:success] = "Du wurdest in das Team eingetragen"
    else
      flash[:error] = "Du konntest dem Team nicht beitreten"
    end
    redirect_to show_me_path
  end

  def updateme
    if current_user.update_attributes(params[:user])
      flash[:success] = "Aenderungen gespeichert"
      redirect_to show_me_path
    else
      flash[:error] = "Aenderungen konnten nicht gespeichert werden"
      render :editme
    end
  end

end
