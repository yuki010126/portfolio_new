class CommentsController < ApplicationController
   before_action :authenticate_customer!

  # def index
  #   @comments = Comment.all.page(params[:page]).per(8)
  # end


  def new
     @comment = current_customer.comments.build
  end

  def show
     @comment = Comment.find(params[:id])
     @chat = Chat.includes(:comments).find(params[:id])
     @comment = Comment.new
     # @comments= @chat.comments.page(params[:page]).per(8)
  end

   def create
     @chat = Chat.find(params[:chat_id])
     @comment = current_customer.comments.build(comment_params)
     @comment = Comment.new(comment_params)
     @comment.chat = @chat
     @comment.customer_id = current_customer.id
     if @comment.save
       redirect_to chat_url(@chat)
     else
       render "chats/show"
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

