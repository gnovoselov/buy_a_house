class AddPriceToHouses < ActiveRecord::Migration[6.0]
  def change
    add_column :houses, :price, :integer
  end
end
