class ContactsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(set_params)
    if @contact.save!
      flash[:alert] = "Merci pour votre message, nous vous répondrons dans les meilleurs délais"
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def set_params
    params.require(:contact).permit(:first_name, :last_name, :company, :email, :message)
  end
end
