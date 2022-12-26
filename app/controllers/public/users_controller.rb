class Public::UsersController < ApplicationController
  def show
    # ユーザー情報
    @user = User.find_by(name: params[:name])
    
    # ユーザー投稿情報
    @notes = @user.notes
    @notes_index = @notes.page(params[:page])
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
  
  def withdraw
    @user = User.find(current_user.id)
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path, notice: "退会処理が完了しました。"
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :image)
  end
  
end
