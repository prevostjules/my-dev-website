class ContactMailer < ApplicationMailer

  def contact_email
    @contact = params[:contact]
    mail(to: @contact.email, subject: 'Welcome to My Awesome Site')
  end
end
