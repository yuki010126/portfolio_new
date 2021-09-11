class ChatsController < ApplicationController
  def index
  end

  def create
    @chats = Chat.all
    @chat = Chat.new(chat_params)
    @chat.customer_id = current_customer.id
    if @chat.save
    else
      render :new
    end
  end

  def destroy
    @chats = Chat.all
    @chat = Chat.find(params[:id])
    @chat.destroy
  end
end

  def show
    @item = Item.find(params[:id])
    @comment = Comment.new
    #新着順で表示
    @comments = @item.comments.order(created_at: :desc)
  end