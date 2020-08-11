class Tag < ApplicationRecord

  has_many :descriptions, dependent: :destroy
  has_many :projects, through: :descriptions

end
