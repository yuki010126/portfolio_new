class CustomersController < ApplicationController

  def index

  end

  def show
      @nickname = current_customer.nickname
      @chats = current_customer.chats
      @discussions = current_customer.discussions
      #byebug
      @threads = Chat.where(id: Comment.where(customer_id: current_customer.id).pluck(:chat_id))
      @texts = Discussion.where(id: Opinion.where(customer_id: current_customer.id).pluck(:discussion_id))
      # @chat = Chat.find(params[:id])
      # @customer = Customer.find(params[:id])
      # @contents = current_customer.contents

      #Comment.where(chat_id: 6).order(created_at: "DESC").limit(5)

      @bookmarks = Bookmark.where(customer_id: current_customer.id)
      @favorites = Favorite.where(customer_id: current_customer.id)
  end


  def withdrawal
    @customer = Customer.find(params[:id])
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end


# private

#   def customer_params
#     params.require(:customer).permit(:nickname)
#   end

end