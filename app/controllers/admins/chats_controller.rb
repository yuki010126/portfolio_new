class Admins::ChatsController < ApplicationController
  before_action :authenticate_admin!

    def index
      @chats = Chat.all
      @chats = Chat.search(params[:keyword])
      @keyword = params[:keyword]
      render "index"
    end

    def show
        @chat = Chat.find(params[:id])
        # @comment = Comment.find(params[:id])
    end

    def destroy
      chat = Chat.find(params[:id])
      chat.destroy
      redirect_to admins_chats_path
    end

    def search
      @discussions = Discussion.search(params[:keyword])
      @keyword = params[:keyword]
      render "index"
    end
end

