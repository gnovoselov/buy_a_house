class Property < ApplicationRecord
  has_many :house_properties, dependent: :destroy
end
