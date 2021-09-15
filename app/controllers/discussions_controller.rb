class DiscussionsController < ApplicationController



   def index
    @discussions = Discussion.all
    @discussions = Discussion.search(params[:keyword])
    @keyword = params[:keyword]
    render "index"

   end

  def new
    @discussion = Discussion.new
  end

  def create
    @discussion = Discussion.new(discussion_params)
    @discussion.customer_id = current_customer.id
    @discussion.save
    redirect_to discussions_path
  end

  def show
   @discussion = Discussion.find(params[:id])
   @opinion = Opinion.new
  end

  def edit
    @discussion = Discussion.find(params[:id])
  end

  def update
    @discussion = Discussion.find(params[:id])
    @discussion.update(discussion_params)
    redirect_to "/discussions/#{@discussion.id}"
  end


  def destroy
    @discussion = Discussion.find(params[:id])
    @discussion.destroy
    redirect_to "/discussions"
  end

  def search
    @discussions = Discussion.search(params[:keyword])
    @keyword = params[:keyword]
  render "index"
  end


  private

  def discussion_params
    params.require(:discussion).permit(:title, :nickname, :customer_id)
  end

end

