class ContactsController < ApplicationController


   def new
      @contact = Contact.new
   end

  def confirm
    if params[:contact].blank?
      @contact = Contact.new
      render :new
      return
    end

    @contact = Contact.new(contact_params)
    if @contact.invalid?
      render :new
    end
  end

  def back
    @contact = Contact.new(contact_params)
    render :new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.send_mail(@contact).deliver_now
      redirect_to done_path
    else
      render :new
    end
  end

  def done
  end

  private

  def contact_params
   #byebug
    if params[:contact].present?
     params.require(:contact).permit(:email, :nickname, :phone_number, :subject,:message )
    end
  end
end
