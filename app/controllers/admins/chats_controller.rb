class Admins::ChatsController < ApplicationController
  before_action :authenticate_admin!

    def index
      @chats = Chat.all
      @chats = Chat.search(params[:keyword])
      @keyword = params[:keyword]
      render "index"
    end

    def destroy
      chat = Chat.find(params[:id])
      chat.destroy
      redirect_to admins_chats_path
    end

end

