class Contact < ApplicationRecord

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

  after_create :send_email

  private

  def send_email
    ContactMailer.with(contact: self).contact_email.deliver_now
  end
end
