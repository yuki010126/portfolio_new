class OpinionsController < ApplicationController
  before_action :authenticate_customer!


  def show
     @opinion = Opinion.find(params[:id])
     @discussion = Discussion.includes(:opinions).find(params[:id])
     @opinion = Opinion.new
  end

   def create
     @discussion = Discussion.find(params[:discussion_id])
     @opinion = Opinion.new(opinion_params)
     @opinion.discussion = @discussion
     @opinion.customer_id = current_customer.id
     # @opinion.save
     # redirect_to discussion_url(@discussion)
     # if @opinion.save
     #   redirect_to discussion_url(@discussion)
     # else
     #   render "discussions/show"
     # end
     @opinion.score = Language.get_data(opinion_params[:content])
      if  @opinion.score > -0.3
        @opinion.save
        redirect_to discussion_url(@discussion)
      else
        redirect_to discussion_url(@discussion)
      end
   end

   def destroy
    @discussion = Discussion.find(params[:discussion_id])
    Opinion.find_by(discussion_id: params[:discussion_id], id: params[:id]).destroy
    redirect_to discussion_url(@discussion)
   end

  private

   def opinion_params
     params.require(:opinion).permit(:nickname, :content, :chat_id, :customer_id, :discussion_id)
   end

end




