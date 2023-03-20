class Public::RelationshipsController < ApplicationController
  before_action :set_user, only: [:create, :destroy]
  
  def create
    current_user.follow(@user)
  end

  def destroy
    current_user.unfollow(@user)
  end
  
  private
  
  def set_user
    @user = User.find_by(name: params[:user_name])
  end
  
end
