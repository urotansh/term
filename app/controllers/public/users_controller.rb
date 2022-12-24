class Public::UsersController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end
  
  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to user_path(current_user.name), notice: "ユーザー情報を更新しました。"
    else
      render :edit
    end
  end

  def quit
  end
  
  
  private
  
  def user_params
    params.require(:user).permit(:name, :image)
  end
  
end
