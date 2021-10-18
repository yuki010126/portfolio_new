class ChatsController < ApplicationController
  before_action :authenticate_customer!

    def index
      @chats = Chat.all.order('updated_at DESC')
      # @page = Article.all.page(params[:page])
      @kinds = Kind.all
      @chats = Chat.order('updated_at DESC').search(params[:keyword]).page(params[:page]).per(15)
      @keyword = params[:keyword]
      render "index"
    end
  
    def new
      @chat = Chat.new
      @chat = current_customer.chats.build
    end
  
    def create
      @chat = Chat.new(chat_params)
      @chat = current_customer.chats.build(chat_params)
      @chat.customer_id = current_customer.id
      @chat.save
      redirect_to chats_path
    end
  
    def show
     @chat = Chat.find(params[:id])
     @comment = Comment.new
     @comments= @chat.comments.order('updated_at DESC').page(params[:page]).per(10)
    end
  
    def edit
      @chat = Chat.find(params[:id])
    end
  
    def update
      @chat = Chat.find(params[:id])
      @chat.update(chat_params)
      redirect_to "/chats/#{@chat.id}"
    end
  
    def destroy
      @chat = Chat.find(params[:id])
      @chat.destroy
      redirect_to "/chats"
    end
  
    def search
      @chats = Chat.search(params[:keyword])
      @keyword = params[:keyword]
    　render "index"
    end
  
    def kind
      @kind = chat.find_by(kind_id: params[:kind_id])
      @Chats = chat.kind
    end
  
  
    private
  
    def chat_params
      params.require(:chat).permit(:title, :nickname, :customer_id, kind_ids: [])
    end

end








