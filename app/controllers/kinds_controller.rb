class KindsController < ApplicationController
   before_action :authenticate_customer!

  def show
   @kind = Kind.find(params[:id])
  end

  def kind


  end

end

