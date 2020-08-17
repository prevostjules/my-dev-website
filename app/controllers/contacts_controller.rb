class ContactsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(set_params)
    success = verify_recaptcha(action: 'contact', minimum_score: 0.5)
    checkbox_success = verify_recaptcha unless success
    if success || checkbox_success
      if @contact.save
        mail_to_client = ContactMailer.with(contact: @contact).send_confirmation
        mail_to_client.deliver_now
        mail_to_admin = ContactMailer.with(contact: @contact).send_message_to_admin
        mail_to_admin.deliver_now
        flash[:alert] = "Merci pour votre message, je vous répondrai dans les meilleurs délais"
        redirect_to root_path
      else
        render :new
      end
    else
      if !success
        @show_checkbox_recaptcha = true
      end
      render :new
    end

  end

  private

  def set_params
    params.require(:contact).permit(:first_name, :last_name, :company, :email, :message, :phone_number)
  end
end
