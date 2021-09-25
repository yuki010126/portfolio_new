class ChatsController < ApplicationController


  def index
    @chats = Chat.all
    # @page = Article.all.page(params[:page])
    @kinds = Kind.all
    @chats = Chat.search(params[:keyword])
    @keyword = params[:keyword]
    render "index"
  end

  def new
    @chat = Chat.new
  end

  def create
    @chat = Chat.new(chat_params)
    @chat.customer_id = current_customer.id
    @chat.save
    redirect_to chats_path
  end

  def show
   @chat = Chat.find(params[:id])
   @comment = Comment.new
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








