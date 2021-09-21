class CustomersController < ApplicationController

  def index
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