class CustomersController < ApplicationController

  def show
  # @customer = current_customer
      # @nickname = current_customer.nickname
      @customer = Customer.find(params[:id])

      # @chats = @customer.chats

      # favorites = Favorite.where(customer_id: current_customer.id).pluck(:chat_id)
      # @favorite_list = Chat.find(favorites)
  end



# private

#   def customer_params
#     params.require(:customer).permit(:nickname)
#   end

 end