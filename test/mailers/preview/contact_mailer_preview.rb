class ContactMailerPreview < ActionMailer::Preview

  def contact_email
    contact = Contact.first
    ContactMailer.with(contact: contact).contact_email
  end
end
