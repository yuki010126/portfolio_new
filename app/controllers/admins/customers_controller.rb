class Admins::CustomersController < ApplicationController

  def index
   @customer = Customer.all
  end

  def show
   @customers = Chat.all
   @customer = Customer.find(params[:id])
  end

  def destroy
   customer = Customer.find(params[:id])
   customer.destroy
   redirect_to admins_customers_path
  end





end
