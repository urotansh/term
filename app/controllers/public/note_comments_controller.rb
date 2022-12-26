class Public::NoteCommentsController < ApplicationController
  def create
    @note_comment = NoteComment.new(note_comment_params)
    @note_comment.user_id = current_user.id
    @note_comment.note_id = params[:note_id]
    
    if @note_comment.save
      # *.js.erbで参照するインスタンス
      @note = Note.find(params[:note_id])
      render "create"
    else
      render "error"
    end
      
  end

  def destroy
  end
  
  private
  
  def note_comment_params
    params.require(:note_comment).permit(:comment)
  end
  
end
