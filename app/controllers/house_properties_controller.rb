class HousePropertiesController < ApplicationController
  before_action :set_property, only: [:update]

  # PATCH/PUT /properties/1
  # PATCH/PUT /properties/1.json
  def update
    @house_property.update(enabled: params[:enabled] == '1')
    @house_property.house.update(rank: house_rank)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @house_property = HouseProperty.find(params[:id])
    end

    def house_rank
      @house_property
        .house
        .properties
        .where(house_properties: { enabled: true })
        .sum(:value)
    end
end
