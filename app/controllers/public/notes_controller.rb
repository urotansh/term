class Public::NotesController < ApplicationController
  def new
    @note = Note.new
  end
  
  def create
    @note = Note.new(note_params)
    @note.user_id = current_user.id
    # TODO:バリデーション
    @note.save
    redirect_to user_path(current_user.name), notice: "新規投稿が成功しました。"
  end

  def index
  end

  def show
    @note = current_user.notes.find(params[:id])
  end

  def edit
    @note = current_user.notes.find(params[:id])
  end
  
  def update
    @note = current_user.notes.find(params[:id])
    # TODO:バリデーション
    @note.update(note_params)
    redirect_to user_path(current_user.name), notice: "投稿内容を更新しました。"
  end
  
  private
  
  def note_params
    params.require(:note).permit(:title, :content)
  end
   
end
