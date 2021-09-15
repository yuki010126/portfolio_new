class CommentsController < ApplicationController

# def index
#     @comment = Comment.new
# end

  def show
     @comment = Comment.find(params[:id])
     @chat = Chat.includes(:comments).find(params[:id])
     @comment = Comment.new
  end

  # def create
  #   @comments = comment.all
  #   @comment = Comment.new(chat_params)
  #   @comment.customer_id = current_customer.id
  #   if @comment.save
  #   else
  #     redirect_to :new
  #   end
  # end

   def create
     @chat = Chat.find(params[:chat_id])
     @comment = Comment.new(comment_params)
     @comment.chat = @chat
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

