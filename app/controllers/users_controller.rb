class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Änderungen am Benutzer wurden gespeichert"
      redirect_to user_path(@user)
    else
      flash[:error] = "Änderungen konnten nicht gespeichert werden"
      render :edit
    end
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "User wurde erfolgreich angelegt"
      redirect_to users_path
    else
      flash[:error] = "User konnte nicht angelegt werden"
      render :new
    end
      
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    if @user.delete
      flash[:success] = "User wurde gelöscht"
    else
      flash[:error] = "User konnte nicht gelöscht werden"
    end
    redirect_to users_path
  end

end
