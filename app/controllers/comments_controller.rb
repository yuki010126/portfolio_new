class CommentsController < ApplicationController
  before_action :authenticate_customer!

   def new
     @comment = current_customer.comments.build
   end

   def show
     @comment = Comment.find(params[:id])
     @chat = Chat.includes(:comments).find(params[:id])
   end

   def create
     @chat = Chat.find(params[:chat_id])
     @comment = current_customer.comments.build(comment_params)
     @comment = Comment.new(comment_params)
     @comment.chat = @chat
     @comment.customer_id = current_customer.id
  
     @comment.score = Language.get_data(comment_params[:content])
      if  @comment.score > -0.3
        @comment.save
        redirect_to chat_url(@chat)
      else
        redirect_to chat_url(@chat)
      end
   end

   def destroy
    @chat = Chat.find(params[:chat_id])
    Comment.find_by(chat_id: params[:chat_id], id: params[:id]).destroy
    redirect_to chat_url(@chat)
   end

   private

   def comment_params
     params.require(:comment).permit(:nickname, :content, :chat_id, :customer_id, :discussion_id)
   end

end

