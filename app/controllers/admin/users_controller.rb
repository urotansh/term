class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_q, only: [:index, :search]
  
  def index
    @users = User.page(params[:page])
  end

  def edit
    @user = User.find_by(name: params[:name])
  end
  
  def update
    @user = User.find_by(name: params[:name])
    if @user.update(user_params)
      redirect_to edit_admin_user_path(@user.name), notice: I18n.t("user.notice.update")
    else
      # レシーバのユーザ名が不正値でupdateされるため正常値へ戻す
      @user.name = params[:name]
      render :edit
    end
  end
  
  def show
    # ユーザー情報
    @user = User.find_by(name: params[:name])
    
    # ユーザー情報がnilの場合は、ユーザー一覧ページへリダイレクトする
    if @user.nil?
      redirect_to admin_users_path, alert: I18n.t("user.alert.does_not_exist", name: params[:name])
      return
    end
    
    # ユーザー投稿一覧(サイドメニュー)
    @notes = @user.notes
    @favorite_notes = @user.favorite_notes
    
    # ユーザー投稿一覧(メインメニュー)
    @title = I18n.t("note.index")
    @notes_pagination = @notes.page(params[:page])
  end

  def search
    @results = @q.result.page(params[:page])
  end
  
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :is_deleted, :image)
  end
  
  def set_q
    @q = User.ransack(params[:q])
  end
  
end
