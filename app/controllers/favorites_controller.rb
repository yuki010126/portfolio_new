class FavoritesController < ApplicationController
  before_action :set_chat
  before_action :authenticate_customer!   # ログイン中のユーザーのみに許可（未ログインなら、ログイン画面へ移動）

  # お気に入り登録
  def create
    if @chat.customer_id != current_customer.id   # 投稿者本人以外に限定
      @favorite = Favorite.create(customer_id: current_customer.id, chat_id: @chat.id)
    end
  end
  # お気に入り削除
  def destroy
    @favorite = Favorite.find_by(customer_id: current_customer.id, chat_id: @chat.id)
    @favorite.destroy
  end

  private
  def set_chat
    @chat = Chat.find(params[:chat_id])
  end

end
