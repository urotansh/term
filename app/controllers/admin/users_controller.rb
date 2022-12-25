class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def edit
    @user = User.find_by(name: params[:name])
  end

  def show
  end
end
