class Admins::DiscussionsController < ApplicationController
  before_action :authenticate_admin!

    def index
      @discussions = Discussion.all
      @opinions= Opinion.all
      @discussions = Discussion.search(params[:keyword])
      @keyword = params[:keyword]
      render "index"
    end

    def show
      @discussion = discussion.find(params[:id])
      @opinion = Opinion.find(params[:id])
    end

    def destroy
      discussion = Discussion.find(params[:id])
      discussion.destroy
      redirect_to admins_discussions_path
    end

    def search
      @discussions = Discussion.search(params[:keyword])
      @keyword = params[:keyword]
      render "index"
    end

end
