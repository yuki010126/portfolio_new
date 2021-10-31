class CustomersController < ApplicationController
   before_action :authenticate_customer!

  def index

  end

  def show
      @nickname = current_customer.nickname
      @chats = current_customer.chats
      @discussions = current_customer.discussions
      #byebug
      @threads = Chat.where(id: Comment.where(customer_id: current_customer.id).pluck(:chat_id))
      @texts = Discussion.where(id: Opinion.where(customer_id: current_customer.id).pluck(:discussion_id))
      @bookmarks = Bookmark.where(customer_id: current_customer.id)
      @favorites = Favorite.where(customer_id: current_customer.id)
  end

  def edit
      @customer = Customer.find(params[:id])
  end

  def update
      @customer = Customer.find(params[:id])
       if current_customer== @customer
       else
        redirect_to root_url
       end
  end

  def withdrawal
      @customer = Customer.find(params[:id])
      @customer.update(is_deleted: true)
      reset_session
      flash[:notice] = "退会処理を実行いたしました"
      redirect_to root_path
  end

end