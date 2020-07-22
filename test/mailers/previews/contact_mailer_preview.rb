# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/contact_mailer/message_test
  def send_confirmation
    ContactMailer.with(contact: Contact.first).send_confirmation
  end

end
