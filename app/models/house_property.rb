class HouseProperty < ApplicationRecord
  belongs_to :house
  belongs_to :property

  class << self
    def add_property(property)
      House.find_each do |house|
        create(house: house, property: property)
      end
    end

    def add_house(house)
      Property.find_each do |property|
        create(house: house, property: property)
      end
    end
  end
end
