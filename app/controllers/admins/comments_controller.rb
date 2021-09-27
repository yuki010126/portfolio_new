class Admins::CommentsController < ApplicationController

  def index
    @comments= Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

   def destroy
     comment = Comment.find(params[:id])
     comment.destroy
     redirect_to admins_chats_path
   end

   # def destroy
   #   Comment.find_by(id: params[:id], chat_id: params[:caht_id]).destroy
   #   @chat = Chat.find_by(id: params[:chat_id])
   #   redirect_to admins_chats_path
   # end
end
