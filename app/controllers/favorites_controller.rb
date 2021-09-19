class FavoritesController < ApplicationController
  before_action :authenticate_customer!   # ログイン中のユーザーのみに許可（未ログインなら、ログイン画面へ移動）

  def create
    @chat = Chat.find(params[:chat_id])
    favorite = @chat.favorites.new(customer_id: current_customer.id)
    if favorite.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def destroy
    @chat = Chat.find(params[:chat_id])
    favorite = @chat.favorites.find_by(customer_id: current_customer.id)
    if favorite.present?
        favorite.destroy
        redirect_to request.referer
    else
        redirect_to request.referer
    end
  end
end