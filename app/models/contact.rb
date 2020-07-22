class Contact < ApplicationRecord

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: { with: /\A.+\@.+\.[a-z]{1,4}\z/}
  validates :phone_number, presence: true, format: { with: /\A(\d{10})|(\+\d{2}\ \d{9})|(\+\d{2}\ \d{1}\ \d{2} \d{2} \d{2} \d{2})|(\+\d{2}\d{9})|(\d{2} \d{2} \d{2} \d{2} \d{2})\z/, message: "- Merci de rentrer un numéro de téléphone suivant l'un de ces formats : 06 00 00 00 00 / 0600000000 / +33600000000 / +33 6 00 00 00 00 / +33 600000000"}, if: :phone_present?

  private

  def phone_present?
    phone_number != ""
  end

end
