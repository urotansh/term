class Admin::UsersController < ApplicationController
  def index
    @users = User.page(params[:page])
  end

  def edit
    @user = User.find_by(name: params[:name])
  end
  
  def update
    @user = User.find_by(name: params[:name])
    if @user.update(user_params)
      redirect_to edit_admin_user_path(@user.name), notice: "ユーザー情報を更新しました。"
    else
      # レシーバのユーザ名が不正値でupdateされるため正常値へ戻す
      @user.name = params[:name]
      render :edit
    end
  end
  
  def show
    @user = User.find_by(name: params[:name])
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :is_deleted, :image)
  end
  
end
