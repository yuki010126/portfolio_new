class CustomersController < ApplicationController

  def index
  # @customer = current_customer
      # @nickname = current_customer.nickname
       @bookmarks = Bookmark.where(customer_id: current_customer.id)
       @favorites = Favorite.where(customer_id: current_customer.id)

      # @chats = @customer.chats

      # favorites = Favorite.where(customer_id: current_customer.id).pluck(:chat_id)
      # @favorite_list = Chat.find(favorites)
  end


# private

#   def customer_params
#     params.require(:customer).permit(:nickname)
#   end

end