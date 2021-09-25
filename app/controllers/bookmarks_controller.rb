class BookmarksController < ApplicationController
   

  def create
    @discussion = Discussion.find(params[:discussion_id])
    bookmark = @discussion.bookmarks.new(customer_id: current_customer.id)
    if bookmark.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def destroy
    @discussion = Discussion.find(params[:discussion_id])
    bookmark = @discussion.bookmarks.find_by(customer_id: current_customer.id)
    if bookmark.present?
        bookmark.destroy
        redirect_to request.referer
    else
        redirect_to request.referer
    end
  end
end


