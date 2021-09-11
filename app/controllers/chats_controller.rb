class ChatsController < ApplicationController



  def new
    @chat = Chat.new
    @chats = Chat.all
  end

  def create
    @chat = Chat.new(chat_params)
    @chat.customer_id = current_customer.id
    if @chat.save
      redirect_to new_chat_path
    else
      render :new
    end
  end

  def edit
   @chat = Chat.find(params[:id])
  end

  def update
    @chat = Chat.find(params[:id])
    if @chat.update(chat_params)
      redirect_to new_chat_path
    else
      render :new
    end
  end

  def destroy
    @chat = Chat.find(params[:id])
    @chat.destroy
    redirect_to request.referer
  end

  private
  def chat_params
    params.require(:chat).permit(:title,:introduction)
  end
end





