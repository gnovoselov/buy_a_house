class ParseZillowService < ApplicationService
  def call
    House.find_each do |house|
      process_house(house)
    end
  end

  private

  def process_house(house)
    begin
      response = parse_zillow(house.zillow_id)
      assign_attributes(house, response)
    rescue StandardError => e
      log_error(e)
    end
  end

  def parse_zillow(zillow_id)
    
  end

  def assign_attributes(house, response)
    house.update!(
      price: get_price(response)
    )
  end

  def extract_price(response)
    # $('h3.ds-price span span.ds-value')
    # .gsub(%w[$ ,], '')
    # .trim
    # .to_i
  end
end
