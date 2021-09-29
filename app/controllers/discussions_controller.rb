class DiscussionsController < ApplicationController
   before_action :authenticate_customer!

   def index
    @discussions = Discussion.all
    @categories = Category.all
    @discussions = Discussion.order('updated_at DESC').search(params[:keyword]).page(params[:page]).per(15)
    @keyword = params[:keyword]
    render "index"
   end


  def new
    @discussion = Discussion.new
    @discussion = current_customer.discussions.build
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
   @opinions= @discussion.opinions.order('updated_at DESC').page(params[:page]).per(8)
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


  def category
    @category = discussion.find_by(category_id: params[:category_id])
    @Discussions = discussion.category
  end

  private

  def discussion_params
    params.require(:discussion).permit(:title, :nickname, :customer_id,  category_ids: [])
  end

end

