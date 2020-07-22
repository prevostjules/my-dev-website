# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/contact_mailer
  def send_confirmation
    ContactMailer.with(contact: Contact.first).send_confirmation
  end

  def send_message_to_admin
    ContactMailer.with(contact: Contact.first).send_message_to_admin
  end

end
