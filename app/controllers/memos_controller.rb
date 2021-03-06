class MemosController < ApplicationController
  before_action :authenticate_customer!

    def create
      @memos = Memo.all
      @memo = Memo.new(memo_params)
      @memo.customer_id = current_customer.id
        if @memo.save
          redirect_to new_memo_path
        else
          render :new
        end
    end

    def new
      @memo = Memo.new
      @memos = Memo.all
      @memos = Memo.search(params[:keyword])
      @keyword = params[:keyword]
      render "new"
    end

    def edit
     @memo = Memo.find(params[:id])
    end

    def update
      @memo = Memo.find(params[:id])
      @memo.update(memo_params)
      redirect_to new_memo_path
    end

    def search
       @memos = Memo.search(params[:keyword])
       @keyword = params[:keyword]
       render "new"
    end


    def destroy
      @memo = Memo.find(params[:id])
      @memo.destroy
      redirect_to request.referer
    end

    private

    def memo_params
      params.require(:memo).permit(:title, :body, :customer_id)
    end

end
