class Project < ApplicationRecord

  belongs_to :user
  has_rich_text :rich_body
  has_many_attached :photos, dependent: :destroy
  has_one_attached :photo, dependent: :destroy
  has_many :descriptions, dependent: :destroy
  has_many :tags, through: :descriptions

end
