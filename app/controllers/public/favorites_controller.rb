class Public::FavoritesController < ApplicationController
  def create
    favorite = Favorite.new(user_id: current_user.id, note_id: params[:note_id])
    favorite.save
    
    # *.js.erbで参照するインスタンス
    @note = Note.find(params[:note_id])
  end

  def destroy
  end
end
