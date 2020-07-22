class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.message.subject
  #
  def send_confirmation
    @contact = params[:contact]
    mail(to: @contact.email, subject: 'Merci pour votre message')
  end
end
