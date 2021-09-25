class Admins::ChatsController < ApplicationController

    def index
        @chats = Chat.all
        @chats = Chat.search(params[:keyword])
        @keyword = params[:keyword]
        render "index"
        # @comments= Comment.all
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

    # def destroy
    #     chat = Chat.find(params[:id])
    #     comments = chat.comments
    #     comments.destroy
    #     redirect_to admins_chats_path
    # end

