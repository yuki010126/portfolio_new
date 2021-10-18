class Admins::DiscussionsController < ApplicationController
  before_action :authenticate_admin!

    def index
      @discussions = Discussion.all
      @discussions = Discussion.search(params[:keyword])
      @keyword = params[:keyword]
      render "index"
    end

    def destroy
      discussion = Discussion.find(params[:id])
      discussion.destroy
      redirect_to admins_discussions_path
    end

end
