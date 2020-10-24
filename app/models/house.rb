class House < ApplicationRecord
  has_many :house_properties, dependent: :destroy
  has_many :properties, through: :house_properties
  has_one_attached :photo, dependent: :destroy

  geocoded_by :address

  after_validation :geocode

  validates :zillow_id, uniqueness: true, presence: true
  validates :photo, presence: true
  validates :address, presence: true
end
